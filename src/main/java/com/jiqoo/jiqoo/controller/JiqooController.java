package com.jiqoo.jiqoo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.jiqoo.user.domain.User;

@Controller
public class JiqooController {

	@Autowired
	private JiqooService jiqooService;

	@Autowired
	private JiqooComtService jiqooComtService;

	@GetMapping("/jiqoo/list")
	public String showJiqooList(Model model, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
			List<Jiqoo> jiqooAllList = jiqooService.selectJiqooAllList();
			List<Jiqoo> jiqooMyList = jiqooService.selectJiqooMyList(userId);
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (categoryList != null) {
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("jiqooAllList", jiqooAllList);
				Gson gson = new Gson();
				model.addAttribute("jiqooJsonList", gson.toJson(jiqooAllList));
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
				model.addAttribute("url", "/jiqoo/list");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/list");
			return "common/message";
		}
	}

	@GetMapping("/jiqoo/detail")
	public String showJiqooDetail(@RequestParam int jiqooNo, Model model) {
		try {
			jiqooService.updateJiqooCount(jiqooNo);
			Jiqoo jiqoo = jiqooService.selectOneByNo(jiqooNo);
			String jiqooCName = jiqoo.getJiqooCtgr();
			Category category = jiqooService.selectCategoryByNo(jiqooCName);
			int likeCount = jiqooService.selectLikeCountByNo(jiqooNo);
			List<Comment> commentList = jiqooComtService.selectCommentList(jiqooNo);
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (jiqoo != null) {
				model.addAttribute("jiqoo", jiqoo);
				model.addAttribute("likeCount", likeCount);
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("category", category);
				model.addAttribute("commentList", commentList);
				return "jiqoo/post_jiqoo";
			} else {
				model.addAttribute("msg", "게시물 조회에 실패하였습니다.");
				model.addAttribute("url", "/jiqoo/list");
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
	@GetMapping(value = "/jiqoo/showMyMap", produces = "application/json;charset=UTF-8;")
	public String showMyMap(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		List<Jiqoo> jiqooMyList = jiqooService.selectJiqooMyList(userId);
		if (jiqooMyList != null) {
			return "success";
		} else {
			return "fail";
		}
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
				model.addAttribute("url", "/jiqoo/list");
				return "common/message";
			} else {
				model.addAttribute("msg", "게시물 삭제에 실패하였습니다.");
				model.addAttribute("url", "/jiqoo/list");
				return "common/message";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/jiqoo/list");
			return "common/message";
		}
	}

	@PostMapping("/jiqoo/update")
	public String updateJiqoo(@ModelAttribute Jiqoo jiqoo, Model model) {
		try {
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

//	// 좋아요
//	   @PostMapping("/jiqoo/like")
//	   @ResponseBody
//	   public String addLike(int memberNo, int reviewNo) {
//	      try {
//	         Like like = new Like();
//	         like.setMemberNo(memberNo);
//	         like.setReviewNo(reviewNo);
//	         int result = rService.addLike(like);
//	         if(result > 0) {
//	            return "success";  // 좋아요 성공
//	         } else {
//	            return "fail";    //좋아요 실패
//	         }
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	         return "error";
//	      }
//	   }
//	   
//	   @PostMapping("/jiqoo/remove")
//	   @ResponseBody
//	   public String removeLike(int reviewNo, int memberNo) {
//	      try {
//	         Like like = new Like();
//	         like.setMemberNo(memberNo);
//	         like.setReviewNo(reviewNo);
//	         int result = rService.removeLike(like);
//	         if(result > 0) {
//	            return "success";  // 좋아요 삭제 성공
//	         } else {
//	            return "fail";  // 좋아요 삭제 실패 
//	         }
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	         return "error";
//	      }
//	   }

//	public PageInfo getPageInfo(int currentPage, int totalCount) {
//		PageInfo pi = null;
//		int recordCountPerPage = 8;
//		int naviCountPerPage = 10;
//		int naviTotalCount;
//		int startNavi;
//		int endNavi;
//		
//		naviTotalCount = (int)((double)totalCount/recordCountPerPage + 0.9);
//		// Math.ceil((double)totalCount/recordCountPerPage)
//		// currentPage값이 1~5일때 startNavi가 1로 고정되도록 구해주는 식
//		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
//		endNavi = startNavi + naviCountPerPage - 1;
//		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최댓값보다 커질 수 있음.
//		if(endNavi > naviTotalCount) {
//			endNavi = naviTotalCount;
//		}
//		pi = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
//		return pi;
//	}
}
