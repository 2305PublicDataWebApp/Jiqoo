package com.jiqoo.jiqoo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jiqoo.common.domain.Category;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.Like;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.service.JiqooComtService;
import com.jiqoo.jiqoo.service.JiqooService;
import com.jiqoo.report.domain.Report;
import com.jiqoo.user.domain.User;

@Controller
public class JiqooController {

	@Autowired
	private JiqooService jiqooService;

	@Autowired
	private JiqooComtService jiqooComtService;

	@GetMapping("/jiqoo/mapList")
	public String showJiqooMapList(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
//			List<Jiqoo> jiqooAllList = jiqooService.selectJiqooAllList();
			List<Jiqoo> jiqooMyList = jiqooService.selectJiqooMyList(userId);
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (categoryList != null) {
				model.addAttribute("categoryList", categoryList);
//				model.addAttribute("jiqooAllList", jiqooAllList);
				model.addAttribute("jiqooMyList", jiqooMyList);
				return "jiqoo/jiqoo";
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

	@GetMapping("/jiqoo/list")
	public String showJiqooList(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
//			List<Jiqoo> jiqooAllList = jiqooService.selectJiqooAllList();
//			List<Jiqoo> jiqooMyList = jiqooService.selectJiqooMyList(userId);
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (categoryList != null) {
				model.addAttribute("categoryList", categoryList);
//				model.addAttribute("jiqooAllList", jiqooAllList);
//				model.addAttribute("jiqooMyList", jiqooMyList);
				return "jiqoo/search_jiqoo";
			} else {
				model.addAttribute("msg", "게시물 리스트 조회 실패");
				model.addAttribute("url", "/jiqoo/mapList");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("url", "/jiqoo/mapList");
			return "common/message";
		}
	}

	@GetMapping("/jiqoo/popupW3WMap")
	public String showPopupMap(Model model) {
		return "jiqoo/popup_map";
	}

	@PostMapping("/jiqoo/insert")
	public String insertJiqoo(Model model, @ModelAttribute Jiqoo jiqoo) {
		try {
			String allowComt = jiqoo.getjAllowComt();
			String openStatus = jiqoo.getjOpenStatus();

			allowComt = allowComt != null ? "Y" : "N";
			openStatus = openStatus != null ? "Y" : "N";
			jiqoo.setjAllowComt(allowComt);
			jiqoo.setjOpenStatus(openStatus);
			int result = jiqooService.insertJiqoo(jiqoo);
			if (result > 0) {
				return "redirect:/jiqoo/list";
			} else {
				model.addAttribute("msg", "게시물 등록 실패");
				model.addAttribute("url", "/jiqoo/mapList");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/mapList");
			return "common/message";
		}
	}

	@GetMapping("/jiqoo/detail")
	public String showJiqooDetail(@RequestParam int jiqooNo, Model model, HttpSession session) {
		try {
			String lUserId = (String) session.getAttribute("userId");
			Like like = new Like(jiqooNo, lUserId);
			jiqooService.updateJiqooCount(jiqooNo);
			Jiqoo jiqoo = jiqooService.selectOneByNo(jiqooNo);
			String jiqooCName = jiqoo.getJiqooCtgr();
			Category category = jiqooService.selectCategoryByNo(jiqooCName);
			int likeCount = jiqooService.selectLikeCountByNo(jiqooNo);
			int likeOrNot = jiqooService.selectLikeOrNot(like);
//			List<Comment> commentList = jiqooComtService.selectCommentList(jiqooNo);
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (jiqoo != null) {
				model.addAttribute("jiqoo", jiqoo);
				model.addAttribute("likeCount", likeCount);
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("category", category);
				model.addAttribute("likeOrNot", likeOrNot);
				return "jiqoo/post_jiqoo";
			} else {
				model.addAttribute("msg", "게시물 조회에 실패하였습니다.");
				model.addAttribute("url", "/jiqoo/mapList");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/list");
			return "common/message";
		}
	}

	@ResponseBody
	@GetMapping(value = "/jiqoo/searchList", produces = "application/json;charset=UTF-8;")
	public String showSearchList(@RequestParam("searchValue") String searchValue,
			@RequestParam("searchOption") String searchOption, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
		params.put("searchValue", searchValue);
		params.put("searchOption", searchOption);
		params.put("userId", userId);

		List<Jiqoo> jiqooSearchList = jiqooService.selectJiqooSearchList(params);
		Gson gson = new Gson();
		return gson.toJson(jiqooSearchList);
	}

	@ResponseBody
	@GetMapping(value = "/jiqoo/showMyMap", produces = "application/json;charset=UTF-8;")
	public String showMyMap(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		List<Jiqoo> jiqooMyList = jiqooService.selectJiqooMyList(userId);
		Gson gson = new Gson();
		return gson.toJson(jiqooMyList);
	}

	@ResponseBody
	@GetMapping(value = "/jiqoo/showAllMap", produces = "application/json;charset=UTF-8;")
	public String showAllMap() {
		List<Jiqoo> jiqooAllList = jiqooService.selectJiqooAllList();
		Gson gson = new Gson();
		return gson.toJson(jiqooAllList);
	}

	@GetMapping("/jiqoo/delete")
	public String deleteJiqoo(@RequestParam("jiqooNo") int jiqooNo, Model model) {
		try {
			int result = jiqooService.deleteJiqoo(jiqooNo);
			if (result > 0) {
				model.addAttribute("msg", "게시물이 삭제되었습니다.");
				model.addAttribute("url", "/jiqoo/mapList");
				return "common/message";
			} else {
				model.addAttribute("msg", "게시물 삭제에 실패하였습니다.");
				model.addAttribute("url", "/jiqoo/mapList");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/mapList");
			return "common/message";
		}
	}

	@PostMapping("/jiqoo/update")
	public String updateJiqoo(@ModelAttribute Jiqoo jiqoo, @RequestParam(value="jOpenStatus", required=false) String jOpenStatus, @RequestParam(value="jAllowComt", required=false) String jAllowComt, Model model) {
		try {
			System.out.println(jOpenStatus + jAllowComt);
			jOpenStatus = jOpenStatus != null ? "Y" : "N";
			jAllowComt = jAllowComt != null ? "Y" : "N";
			jiqoo.setjAllowComt(jAllowComt);
			jiqoo.setjOpenStatus(jOpenStatus);
			int result = jiqooService.updateJiqoo(jiqoo);
			if (result > 0) {
				model.addAttribute("msg", "게시물이 수정되었습니다.");
				model.addAttribute("url", "/jiqoo/detail?jiqooNo=" + jiqoo.getJiqooNo());
				return "common/message";
			} else {
				model.addAttribute("msg", "게시물 수정에 실패하였습니다.");
				model.addAttribute("url", "/jiqoo/detail?jiqooNo=" + jiqoo.getJiqooNo());
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/detail?jiqooNo=" + jiqoo.getJiqooNo());
			return "common/message";
		}
	}
	
	@ResponseBody
	@GetMapping("/jiqoo/report")
	public String reportJiqoo(@ModelAttribute Report report) {
		if(report.getReportType().equals("J")) {
			int result = jiqooService.insertJiqooReport(report);
			if(result > 0) {
				return "jiqooReport";
			}else {
				return "fail";
			}
		}else{
			int result = jiqooService.insertJiqooComtReport(report);
			if(result > 0) {
				return "jiqooComtReport";
			}else {
				return "fail";
			}
		}
	}

	@ResponseBody
	@PostMapping("/uploadSummernoteImageFile")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
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
			String jiqooFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;

			// 이미지 저장 코드
			multipartFile.transferTo(new File(savePath + "\\" + jiqooFileRename));

			System.out.println(savePath);

			src = "../resources/summerImageFiles/" + jiqooFileRename;
//	        jsonObject.addProperty("url", "../resources/summerImageFiles" + jiqooFileRename); 
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

	
	// 좋아요
	@ResponseBody
	@GetMapping("/jiqoo/like")
	public String like(@RequestParam("refPostNo") int refPostNo, HttpSession session) {
		String lUserId = (String)session.getAttribute("userId");
		Like like = new Like(refPostNo, lUserId);
		int result = jiqooService.selectLikeOrNot(like);
		if(result == 0) {
			int insertLike = jiqooService.insertLike(like);
			if(insertLike > 0) {
				return "insert";
			}else {
				return "fail";
			}
		}else {
			int deleteLike = jiqooService.deleteLike(like);
			if(deleteLike > 0) {
				return "delete";
			}else {
				return "fail";
			}
		}
	}
	
	// 초기 지꾸 전체 리스트
	@ResponseBody
	@GetMapping("/jiqoo/loadInitialJiqooAllList")
    public List<Jiqoo> loadInitialJiqooAllList() {
        List<Jiqoo> initialJiqooAllList = jiqooService.loadInitialJiqooAllList();
        return initialJiqooAllList;
    }
	
	// 지꾸 전체 리스트 스크롤 이벤트
	@ResponseBody
	@GetMapping("/jiqoo/loadMoreJiqllAllList")
	public ResponseEntity<List<Jiqoo>> loadMoreJiqllAllList(@RequestParam("offset") int offset, @RequestParam("limit") int limit) {
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
		List<Jiqoo> newList = jiqooService.loadMoreJiqooAllList(params);
        return ResponseEntity.ok(newList);
	}
	

	// 초기 지꾸 본인 리스트
	@ResponseBody
	@GetMapping("/jiqoo/loadInitialJiqooMyList")
    public List<Jiqoo> loadInitialJiqooMyList(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
        List<Jiqoo> initialJiqooMyList = jiqooService.loadInitialJiqooMyList(userId);
        return initialJiqooMyList;
    }
	
	// 지꾸 본인 리스트 스크롤 이벤트
	@ResponseBody
	@GetMapping("/jiqoo/loadMoreJiqooMyList")
	public ResponseEntity<List<Jiqoo>> loadMoreJiqooMyList(@RequestParam("offset") int offset, @RequestParam("limit") int limit, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("userId", userId);
		List<Jiqoo> newList = jiqooService.loadMoreJiqooMyList(params);
        return ResponseEntity.ok(newList);
	}
	
	// 초기 지꾸 검색 리스트
	@ResponseBody
	@GetMapping("/jiqoo/loadInitialJiqooSearchList")
    public List<Jiqoo> loadInitialJiqooSearchList(String searchValue, String searchOption, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
        params.put("searchValue", searchValue);
        params.put("searchOption", searchOption);
        params.put("userId", userId);
        List<Jiqoo> initialJiqooSearchList = jiqooService.loadInitialJiqooSearchList(params);
        return initialJiqooSearchList;
    }
	
	// 지꾸 검색 리스트 스크롤 이벤트
	@ResponseBody
	@GetMapping("/jiqoo/loadMoreJiqooSearchList")
	public ResponseEntity<List<Jiqoo>> loadMoreComments(String searchValue, String searchOption, @RequestParam("offset") int offset, @RequestParam("limit") int limit, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("searchValue", searchValue);
        params.put("searchOption", searchOption);
        params.put("userId", userId);
		List<Jiqoo> newList = jiqooService.loadMoreJiqooSearchList(params);
        return ResponseEntity.ok(newList);
	}

}
