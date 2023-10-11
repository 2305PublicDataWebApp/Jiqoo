package com.jiqoo.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.report.service.AdminService;
import com.jiqoo.user.domain.User;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	//관리자페이지 메인 접속
	@GetMapping("/admin/main.do")
	public ModelAndView showAdminMain(ModelAndView mv) {
		mv.setViewName("admin/admin_main");
		return mv;
	}
	
	//회원관리페이지접속
	@GetMapping("/admin/user.do")
	public ModelAndView showAdminUser(ModelAndView mv
									, @ModelAttribute User user
									, @RequestParam (value="page", required=false, defaultValue="1") Integer currentPage) {
		//SELECT COUNT (*) FROM USER_TBL;
		//SELECT * FROM USER_TBL ORDER BY U_CREATE_DATE DESC
		Integer totalCount = adminService.getListCount();
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalCount);
		List<User>userList = adminService.selectAllUser(pInfo);
		try {
			if(userList.size()>0) {
				mv.addObject("userList", userList).addObject("pInfo", pInfo).setViewName("admin/admin_user");
			}else {
				mv.addObject("msg", "가입한 회원이 없습니다").setViewName("admin/admin_user");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "전체 회원 조회 실패");
			mv.addObject("url", "redirect:/index.jsp");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	//회원관리_디테일 접속
	@GetMapping("/admin/userDetail.do")
	public ModelAndView showAdminUserDetail(ModelAndView mv) {
		mv.setViewName("admin/admin_user_detail");
		return mv;
	}
	
	
	
	
	//지꾸관리 접속
	@GetMapping("/admin/jiqoo.do")
	public ModelAndView showAdminJiqoo(ModelAndView mv) {
		mv.setViewName("admin/admin_jiqoo");
		return mv;
	}
	
	//모꾸관리 접속
	@GetMapping("/admin/moqoo.do")
	public ModelAndView showAdminMoqoo(ModelAndView mv) {
		mv.setViewName("admin/admin_moqoo");
		return mv;
	}
	
	//채팅방관리 접속
	@GetMapping("/admin/chat.do")
	public ModelAndView showAdminChat(ModelAndView mv) {
		mv.setViewName("admin/admin_chat");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//**공통메소드********************************************************************************************	

	/**
	 * 페이지네이션 메소드
	 */
	public PageInfo getPageInfo(Integer recordCountPerPage, Integer currentPage, Integer totalCount ) {
		
		int naviCountPerPage = 5;
		int naviTotalCount;
		
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(endNavi, naviCountPerPage, naviCountPerPage, startNavi, endNavi, naviTotalCount, naviTotalCount);
		return pInfo;
	}	
	
	

}
