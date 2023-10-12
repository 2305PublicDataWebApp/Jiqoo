package com.jiqoo.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.user.domain.User;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	// 관리자페이지 메인 접속
	@GetMapping("/admin/main")
	public ModelAndView showAdminMain(ModelAndView mv) {
		mv.setViewName("admin/admin_main");
		return mv;
	}

	// 회원관리페이지접속
	@GetMapping("/admin/userlist")
	public ModelAndView showAdminUser(ModelAndView mv, @ModelAttribute User user,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		// SELECT COUNT (*) FROM USER_TBL;
		// SELECT * FROM USER_TBL ORDER BY U_CREATE_DATE DESC

		Integer totalUserCount = adminService.getUserListCount(); // 총 회원 수
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalUserCount);
		List<User> userList = adminService.selectAllUser(pInfo); // 전체회원리스트

		try {
			if (userList.size() > 0) {
				mv.addObject("userList", userList);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("admin/admin_user");
			} else {
				mv.addObject("msg", "가입한 회원이 없습니다.");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "전체 회원 조회 실패");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 회원관리_서치페이지
	@GetMapping("/admin/usersearch")
	public ModelAndView SearchAdminUserList(ModelAndView mv, @RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);

		// 서치.jsp 페이징처리
		Integer totalSearchUserCount = adminService.getUserSearchListCount(paramMap); // 총 회원 수
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalSearchUserCount);

		List<User> searchUserList = adminService.searchUserByKeyword(pInfo, paramMap);

		try {
			if (searchUserList.size() > 0) {
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);

				// 검색결과 페이징
				mv.addObject("pInfo", pInfo);
				mv.addObject("searchUserList", searchUserList);

				mv.setViewName("admin/admin_search");

			} else {
				mv.addObject("msg", "검색결과가 없습니다.");
				mv.addObject("url", "/admin/userlist");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "검색 실패");
			mv.addObject("url", "/admin/userlist");
			mv.setViewName("common/message");
		}
		return mv;

	}

	// 회원관리_디테일 접속
	@GetMapping("/admin/userdetail")
	public ModelAndView showAdminUserDetail(ModelAndView mv, @RequestParam("userId") String userId) {
		// SELECT * FROM USER_TBL WHERE USER_ID = ?
		try {
			User user = adminService.selectUserByUserId(userId);
			if (user != null) {
				mv.addObject("user", user);
				mv.setViewName("admin/admin_user_detail");
			} else {
				mv.addObject("msg", "회원조회를 실패했습니다.");
				mv.addObject("url", "/admin/userlist"); // 그냥 뒤로가기는 어떻게 하지?
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "회원 상세조회 실패");
			mv.addObject("url", "/admin/userlist");
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 지꾸관리 접속
	@GetMapping("/admin/jiqoo")
	public ModelAndView showAdminJiqoo(ModelAndView mv) {
		mv.setViewName("admin/admin_jiqoo");
		return mv;
	}

	// 모꾸관리 접속
	@GetMapping("/admin/moqoo")
	public ModelAndView showAdminMoqoo(ModelAndView mv) {
		mv.setViewName("admin/admin_moqoo");
		return mv;
	}

	// 채팅방관리 접속
	@GetMapping("/admin/chat")
	public ModelAndView showAdminChat(ModelAndView mv) {
		mv.setViewName("admin/admin_chat");
		return mv;
	}

//**공통메소드********************************************************************************************	

	/**
	 * 페이지네이션 메소드
	 */
	public PageInfo getPageInfo(Integer recordCountPerPage, Integer currentPage, Integer totalCount) {

		Integer naviCountPerPage = 5;
		Integer naviTotalCount;

		naviTotalCount = (int) Math.ceil((double) totalCount / recordCountPerPage);

		int startNavi = ((int) ((double) currentPage / naviCountPerPage + 0.9) - 1) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi,
				naviTotalCount, totalCount);
		return pInfo;
	}

}
