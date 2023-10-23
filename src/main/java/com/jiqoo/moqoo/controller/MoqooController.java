package com.jiqoo.moqoo.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.domain.MoqooUser;
import com.jiqoo.moqoo.service.MoqooComtService;
import com.jiqoo.moqoo.service.MoqooService;
import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;

@Controller
public class MoqooController {
	
	@Autowired
	private MoqooService moqooService;
	
	@Autowired
	private MoqooComtService moqooComtService;
	
	
	@GetMapping("/moqoo/mapList")
	public String showMoqooMapList(Model model, HttpSession session) {
		try {
//			String userId = (String) session.getAttribute("userId");
			List<Moqoo> moqooAllList = moqooService.selectMoqooAllList();
			List<Category> categoryList = moqooService.selectCategoryList();
			if (categoryList != null) {
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("moqooAllList", moqooAllList);
				return "moqoo/moqoo";
			} else {
				model.addAttribute("msg", "게시물 리스트 조회 실패");
				model.addAttribute("url", "/");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("url", "/");
			return "common/message";
		}
	}

	// 모꾸 리스트 가져오면서 모꾸 페이지로 이동
	@GetMapping("/moqoo/moqoo")
	public String showMoqooList(@ModelAttribute Moqoo moqoo, User user,  Model model, HttpSession session, HttpServletRequest request) {
		try {
	//		String moqooWriter = (String)session.getAttribute("userNickName");
	//		String writerProfile = (String)session.getAttribute("userPhotoPath");
				
	//		moqoo.setMoqooWriter(moqooWriter);
	//		List<User> userList = userService.selectUserList();
			// 모꾸 게시물 리스트 조회하기
			List<Moqoo> moqooList  = moqooService.showSelectMoqooList();
			List<Category> categoryList = moqooService.selectCategoryList();
			if(moqooList != null) {
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("moqooList", moqooList);
				return "moqoo/moqoo";
			}
			else {
				model.addAttribute("msg", "게시물 리스트 조회에 실패했습니다.");
				model.addAttribute("url", "/");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("url", "/");
			return "common/message";
		}
	}
	
	// 팝업창에 W3W 불러오기
	@GetMapping("/moqoo/popup_map")
	public String showPopupMap() {
		return "moqoo/popup_map";
	}

	// 게시글 작성
	@PostMapping("/moqoo/insert")
	public String insertMoqoo(@ModelAttribute Moqoo moqoo
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, HttpSession session
			, Model model) {
		
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> moqooMap = this.saveFile(uploadFile, request);
				moqoo.setMoqooThumName((String)moqooMap.get("fileName"));
				moqoo.setMoqooThumRename((String)moqooMap.get("fileRename"));
				moqoo.setMoqooThumPath((String)moqooMap.get("filePath"));
			}
			int result = moqooService.insertMoqoo(moqoo);
			MoqooUser moqooUser = new MoqooUser();
			if(result > 0) {
				// 게시글 작성하면서 작성자도 모임 참여되게 만들기
				moqooUser.setRefMoqooNo(moqoo.getMoqooNo()); // 모임 번호 설정
	            moqooUser.setRefUserId((String)session.getAttribute("userId")); // 사용자 ID 설정
	            moqooUser.setAttendStatus("Y"); // 참석 상태 설정
	            moqooService.insertMoqooUser(moqooUser);
				return "redirect:/moqoo/moqoo";
			}
			else {
				model.addAttribute("msg", "모임 등록이 완료되지 않았습니다.");
				model.addAttribute("url", "/moqoo/moqoo");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/moqoo/moqoo");
			return "common/message";
		}
	}
	
	// 모꾸 게시글 상세페이지
	@GetMapping("/moqoo/detail")
	public String showMoqooDetail(@RequestParam("moqooNo") Integer moqooNo, Model model, HttpSession session) {
		try {
			String lUserId = (String) session.getAttribute("userId");
			// 좋아요
			Like like = new Like(moqooNo, lUserId);
			// 조회수
			moqooService.updateMoqooCount(moqooNo);
			// 게시글 내용 가져오면서 댓글도 같이 가져오기
			Moqoo moqoo = moqooService.selectOneByNo(moqooNo);
			String moqooCName = moqoo.getCategory();
			Category category = moqooService.selectCategoryByNo(moqooCName);
			List<Category> categoryList = moqooService.selectCategoryList();
			int likeCount = moqooService.selectLikeCountByNo(moqooNo);
			int likeOrNot = moqooService.selectLikeOrNot(like);
			int moqooJoinCount = moqooService.selectJoinCount(moqooNo);
			if(moqoo != null) {
//				// 게시글 번호에 맞는 댓글들 가져오기
//				List<Comment> comtList = moqooComtService.initialComments(moqooNo);
				// 모임 참여신청자들
				List<MoqooUser> moqooUserList  = moqooService.selectMoqooUserList(moqooNo);
//				if(comtList.size() > 0) {
//					model.addAttribute("comtList", comtList);
//				}
				if(moqooUserList.size() > 0) {
					model.addAttribute("moqooList", moqooUserList);
				}
				model.addAttribute("moqoo", moqoo);
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("likeCount", likeCount);
				model.addAttribute("joinCount", moqooJoinCount);
				model.addAttribute("likeOrNot", likeOrNot);
				return "moqoo/post_moqoo";
			}
			else {
				model.addAttribute("msg", "게시글 데이터 조회를 실패하였습니다.");
				model.addAttribute("url", "/moqoo/moqoo");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/moqoo/moqoo");
			return "common/message";
		}
	}
	
	@ResponseBody
	@GetMapping(value =  "/moqoo/searchList", produces = "application/json;charset=UTF-8;")
	public String showSearchList(@RequestParam("searchValue") String searchValue, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
		params.put("searchValue", searchValue);
		params.put("userId", userId);

		List<Moqoo> moqooSearchList = moqooService.selectMoqooSearchList(params);
		Gson gson = new Gson();
		return gson.toJson(moqooSearchList);
	}
	
	
	@ResponseBody
	@PostMapping("/moqoo/post")
	public String insertMoqooPost(
			 @RequestParam("refMoqooNo") int refMoqooNo
			, @RequestParam("userId") String refUserId
			, @RequestParam("attendStatus") String attendStatus) {
		MoqooUser moqooUser = new MoqooUser(refMoqooNo, refUserId, attendStatus);
		int moqooJoinCount = moqooService.selectJoinCount(refMoqooNo);
		int moqooJoinFull = moqooService.selectOneByMoqooJoin(refMoqooNo);
		if(moqooJoinFull <= moqooJoinCount) {
			return "full";
		}
		int result = moqooService.insertMoqooPost(moqooUser);
		if(result > 0) {
			return "true";
		}
		else {
			return "false";
		}
	}
	
//	@GetMapping("/moqoo/report")
//	public String insertReport(@ModelAttribute Report report, @RequestParam("reportContent") String reportContent, @RequestParam("moqooNo") int moqooNo, Model model, HttpSession session) {
//		try {
//			String userId = (String) session.getAttribute("userId");
//			if(userId != null && !userId.equals("")) {
//				report.setReportWriter(userId);
//				report.setReportContent(reportContent);
//				report.setReportPostNo(moqooNo);
//				int result = moqooService.insertReport(report);
//				if(result > 0) {
//					return "redirect:/moqoo/moqoo";
//				}
//				else {
//					model.addAttribute("msg", "신고접수가 완료되지 않았습니다.");
//					model.addAttribute("url", "/moqoo/moqoo");
//					return "common/message";
//				}
//			}
//			else {
//				model.addAttribute("msg", "회원정보가 없습니다. 로그인 후 이용해 주셍.");
//				model.addAttribute("url", "/moqoo/moqoo");
//				return "common/message";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", e.getMessage());
//			model.addAttribute("url", "/moqoo/moqoo");
//			return "common/message";
//		}
//	}
	
	// 좋아요
		@ResponseBody
		@GetMapping("/moqoo/like")
		public String like(@RequestParam("refPostNo") int refPostNo, HttpSession session) {
			String lUserId = (String)session.getAttribute("userId");
			Like like = new Like(refPostNo, lUserId);
			int result = moqooService.selectLikeOrNot(like);
			if(result == 0) {
				int insertLike = moqooService.insertLike(like);
				if(insertLike > 0) {
					return "insert";
				}else {
					return "fail";
				}
			}else {
				int deleteLike = moqooService.deleteLike(like);
				if(deleteLike > 0) {
					return "delete";
				}else {
					return "fail";
				}
			}
		}
	
	@PostMapping("moqoo/update")
	public String updateMoqoo(@ModelAttribute Moqoo moqoo,@RequestParam(value = "uploadFile", required=false) MultipartFile uploadFile, Model model, HttpServletRequest request) {
		try {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				String fileName = moqoo.getMoqooThumRename();
				if(fileName != null) {
					this.deleteFile(request, fileName);
				}
				Map<String, Object> moqooMap = this.saveFile(uploadFile, request);
				moqoo.setMoqooThumName((String)moqooMap.get("fileName"));
				moqoo.setMoqooThumRename((String)moqooMap.get("fileRename"));
				moqoo.setMoqooThumPath((String)moqooMap.get("filePath"));
			}
			int result = moqooService.updateMoqoo(moqoo);
			if(result > 0) {
				model.addAttribute("msg", "게시물이 수정되었습니다.");
				model.addAttribute("url", "/moqoo/detail?moqooNo=" + moqoo.getMoqooNo());
				return "moqoo/post_moqoo";
			}
			else {
				model.addAttribute("msg", "게시물이 수정에 실패하였습니다.");
				model.addAttribute("url", "/moqoo/detail?moqooNo=" + moqoo.getMoqooNo());
				return "common/message";
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/moqoo/detail?moqooNo=" + moqoo.getMoqooNo());
			return "common/message";
		}
	}
	
	@GetMapping("moqoo/delete")
	public String deleteMoqoo(@RequestParam("moqooNo") int moqooNo,@RequestParam("moqooWriter") String moqooWriter, Model model, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			if(moqooWriter != null && moqooWriter.equals(userId)) {
				int result = moqooService.deleteMoqoo(moqooNo);
				if(result > 0) {
					model.addAttribute("msg", "게시물이 삭제되었습니다.");
					model.addAttribute("url", "/moqoo/moqoo");
					return "redirect:/moqoo/moqoo";
				}
				else {
					model.addAttribute("msg", "게시물 삭제에 실패하였습니다.");
					model.addAttribute("url", "/moqoo/moqoo");
					return "common/message";
				}
			}
			else {
				model.addAttribute("msg", "게시물 삭제 권한이 없습니다.");
				model.addAttribute("url", "/moqoo/moqoo");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/moqoo/moqoo");
			return "common/message";
		}
	}
	
	@ResponseBody
	@GetMapping(value = "/moqoo/AllList", produces = "application/json;charset=UTF-8;")
	public String showAllList() {
		List<Moqoo> moqooAllList = moqooService.selectMoqooAllList();
		Gson gson = new Gson();
		return gson.toJson(moqooAllList);
	}
	
	@ResponseBody
	@GetMapping(value = "/moqoo/showAllMap", produces = "application/json;charset=UTF-8;")
	public String showAllMap() {
		List<Moqoo> moqooAllList = moqooService.selectMoqooAllList();
		Gson gson = new Gson();
		return gson.toJson(moqooAllList);
	}
	
	// 초기 모꾸 전체 리스트
	@ResponseBody
	@GetMapping("/moqoo/loadInitialMoqooAllList")
    public List<Moqoo> loadInitialMoqooAllList() {
        List<Moqoo> InitialMoqooAllList = moqooService.loadInitialMoqooAllList();
        return InitialMoqooAllList;
    }
	
	// 모꾸 전체 리스트 스크롤 이벤트
	@ResponseBody
	@GetMapping("/moqoo/loadMoreMoqooAllList")
	public ResponseEntity<List<Moqoo>> loadMoreMoqooAllList(@RequestParam("offset") int offset, @RequestParam("limit") int limit) {
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
		List<Moqoo> newList = moqooService.loadMoreMoqooAllList(params);
        return ResponseEntity.ok(newList);
	}
	
	// 참여신청자 승인하기
	@PostMapping("/moqoo/attendY")
    @ResponseBody
    public String approveUser(
    		@RequestParam("refMoqooNo") int refMoqooNo
    		, @RequestParam("refUserId") String refUserId
    		, @RequestParam("attendStatus") String attendStatus ) {
        // 승인 로직을 수행합니다.
		MoqooUser moqooUser = new MoqooUser(refMoqooNo, refUserId, attendStatus);
		int result = moqooService.updateYesAttend(moqooUser);
		if(result > 0) {
			return "true";
		}
		else {
			return "false";
		}
        // 승인 처리 후 메시지 반환
    }

	
	// 참여신청자 거절하기
    @PostMapping("/moqoo/sorry")
    @ResponseBody
    public String rejectUser() {
        // 거절 로직을 수행합니다.
        // 거절 처리 후 메시지 반환
        return "사용자가 거절되었습니다.";
    }
	
	
//    @PostMapping("/moqoo/heart")
//    @ResponseBody
//    public String clickHeart(@RequestParam("refPostNo") int refPostNo, @RequestParam("userId") String lUserId, @RequestParam("refBoardType") String refBoardType ) {
//    	
//    	Like like = new Like(refPostNo, refBoardType, lUserId);
//    	Like likeOne = moqooService.selectLikeOne(like);
//    	if(likeOne == null) {
//    		int result = moqooService.clickHeart(like);
//    		if(result > 0) {
//            	return "true";
//    		}
//    		else {
//    			return "false";
//            }
//    	}
//    	else {
//    		// 좋아요 테이블에서 삭제 (두번 클릭시 좋아요 취소)
//    		int result = moqooService.deleteLike(like);
//    		if(result > 0) {
//    			return "true";
//    		}
//    		else {
//    			return "false";
//    		}
//    	}
//       
//        
//    }
    
//    @PostMapping("/moqoo/likeCount")
//    @ResponseBody
//    public String moqooLikeCount(@RequestParam("refPostNo") int refPostNo ) {
//       int result = moqooService.moqooLikeCount(refPostNo);
//    	return result + "";
//    }
	

	// 섬머노트 사진 저장하기
	@ResponseBody
	@PostMapping("/muploadSummernoteImageFile")
	public String mUploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
//	    JsonObject jsonObject = new JsonObject();
		String src = "";
		try {
			String originalFileName = multipartFile.getOriginalFilename();
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 이미지를 저장할 경로
			String savePath = root + "\\summerImageFiles";

			// 디렉토리 생성 코드
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			String moqooFileRename = "m" + sdf.format(new Date(System.currentTimeMillis())) + "." + extension;

			// 이미지 저장 코드
			multipartFile.transferTo(new File(savePath + "\\" + moqooFileRename));

			System.out.println(savePath);

			src = "../resources/summerImageFiles/" + moqooFileRename;
//	        jsonObject.addProperty("url", "../resources/summerImageFiles" + moqooFileRename); 
//	        jsonObject.addProperty("originName", originalFileName); 
//	        jsonObject.addProperty("responseCode", "success"); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
//	    return jsonObject; 
		return src;
	}

	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		// resource 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
	
		// 시간으로 파일 이름 바꾸기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = "m" + simpleDateFormat.format(new Date(System.currentTimeMillis())) + "." + extension;
	
		// 폴더 없을 시 자동 생성할 폴더
		String savePath = root + "\\muploadFiles";
		
		File saveFolder = new File(savePath);
		
		if(!saveFolder.exists()) {  // 파일 존재 여부 확인
			saveFolder.mkdir();  // 폴더 생성
		}
		
		// 파일 저장하기
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/muploadFiles/" + fileRename);
		
		return fileMap;
	}

	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root + "\\muploadFiles\\" + fileName;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
	}
}
