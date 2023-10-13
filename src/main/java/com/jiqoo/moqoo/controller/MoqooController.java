package com.jiqoo.moqoo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.moqoo.service.MoqooComtService;
import com.jiqoo.moqoo.service.MoqooService;
import com.jiqoo.user.domain.User;

@Controller
public class MoqooController {
	
	@Autowired
	private MoqooService moqooService;
	private MoqooComtService moqooComtService;
	

	// 모꾸 리스트 가져오면서 모꾸 페이지로 이동
	@GetMapping("/moqoo/moqoo")
	public String showSelectMoqooList(@ModelAttribute Moqoo moqoo, User user,  Model model, HttpSession session, HttpServletRequest request) {
//		String moqooWriter = (String)session.getAttribute("userNickName");
//		String writerProfile = (String)session.getAttribute("userPhotoPath");
				
//		moqoo.setMoqooWriter(moqooWriter);
//		List<User> userList = userService.selectUserList();
		// 모꾸 게시물 데려오기
		List<Moqoo> moqooList  = moqooService.showSelectMoqooList();
		model.addAttribute("moqooList", moqooList);
		return "moqoo/moqoo";
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
			, HttpSession session
			, HttpServletRequest request
			, Model model) {
		
		try {
			String moqooWriter = (String)session.getAttribute("userNickname");
			moqoo.setMoqooWriter(moqooWriter);
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> moqooMap = this.saveFile(uploadFile, request);
				moqoo.setMoqooThumName((String)moqooMap.get("fileName"));
				moqoo.setMoqooThumRename((String)moqooMap.get("fileRename"));
				moqoo.setMoqooThumPath((String)moqooMap.get("filePath"));
			}
			int mOne = moqooService.insertMoqoo(moqoo);
			if(mOne > 0) {
				return "redirect:/moqoo/moqoo";
			}
			else {
				model.addAttribute("msg", "모임 등록이 완료되지 않았습니다.");
				model.addAttribute("url", "/moqoo/moqoo");
				return "common/result";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의하세요");
			model.addAttribute("url", "/moqoo/moqoo");
			return "common/result";
		}
	}
	
	// 모꾸 게시글 상세페이지
	@GetMapping("/moqoo/post_moqoo")
	public String showMoqooDetail(@RequestParam("moqooNo") Integer moqooNo, Model model) {
		try {
			// 게시글 내용 가져오면서 댓글도 같이 가져오기
			Moqoo moqoo = moqooService.selectMoqooByNo(moqooNo);
			if(moqoo != null) {
				// 게시글 번호에 맞는 댓글들 가져오기
				List<Comment> comtList = moqooComtService.selectComtList(moqooNo);
				if(comtList.size() > 0) {
					model.addAttribute("comtList", comtList);
				}
				model.addAttribute("moqoo", moqoo);
				return "moqoo/post_moqoo";
			}
			else {
				model.addAttribute("msg", "게시글 데이터 조회를 실패하였습니다.");
				model.addAttribute("url", "/moqoo/moqoo_post");
				return "common/result";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의하세요");
			model.addAttribute("url", "/moqoo/moqoo_post");
			return "common/result";
		}
	}
	
	

	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		// resource 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resource");
		
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 시간으로 파일 이름 바꾸기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("m" + "yyyyMMddHHmmss");
		String fileRename = simpleDateFormat.format(new Date(System.currentTimeMillis())) + "." + extension;

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
}
