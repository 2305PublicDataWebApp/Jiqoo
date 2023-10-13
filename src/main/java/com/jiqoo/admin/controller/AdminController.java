package com.jiqoo.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.admin.service.AdminService;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
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

	// 총 회원리스트
	@GetMapping("/admin/userlist")
	public ModelAndView showAdminUser(ModelAndView mv
									, @ModelAttribute User user
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
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
	public ModelAndView SearchAdminUserList(ModelAndView mv
										, @RequestParam("searchCondition") String searchCondition
										, @RequestParam("searchKeyword") String searchKeyword
										, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {

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
//	@GetMapping("/admin/userdetail")
//	public ModelAndView showAdminUserDetail(ModelAndView mv
//										  , @RequestParam("userId") String userId) {
//		// SELECT * FROM USER_TBL WHERE USER_ID = ?
//		try {
//			User user = adminService.selectUserByUserId(userId);
//			if (user != null) {
//				mv.addObject("user", user);
//				mv.setViewName("admin/admin_user_detail");
//			} else {
//				mv.addObject("msg", "회원조회를 실패했습니다.");
//				mv.addObject("url", "/admin/userlist"); // 그냥 뒤로가기는 어떻게 하지?
//				mv.setViewName("common/message");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "회원 상세조회 실패");
//			mv.addObject("url", "/admin/userlist");
//			mv.setViewName("common/message");
//		}
//		return mv;
//	}
	
	//회원강제탈퇴
	@GetMapping("/admin/userdelete")
	public ModelAndView deleteUserByAdmin (ModelAndView mv
										, @RequestParam("userId") String userId) {
		//UPDATE USER_TBL SET USER_STATUS = 'N' WHERE USER_ID = ?
		try {
			Integer result = adminService.deleteUserByAdmin(userId);
			if(result>0) {
				mv.addObject("msg", "회원 강제탈퇴 완료");
				mv.addObject("url", "/admin/userdetail?userId="+userId);
				mv.setViewName("common/message");
				//탈퇴시킬때 회원 강제 로그아웃 시키려면?
				
			}else {
				mv.addObject("msg", "회원 강제탈퇴를 완료하지 못했습니다.");
				mv.addObject("url", "/admin/userdetail?userId="+userId);
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "회원 강제탈퇴 실패");
			mv.addObject("url", "/admin/userdetail?userId="+userId);
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	//회원복원
	@GetMapping("/admin/userrevival")
	public ModelAndView reviveUserByAdmin (ModelAndView mv
								  		, @RequestParam("userId") String userId) {
		//UPDATE USER_TBL SET USER_STATUS = 'Y', U_DELETE_DATE = '-' WHERE USER_ID = ?
		try {
			Integer result = adminService.reviveUserByAdmin(userId);
			if(result>0) {
				mv.addObject("msg", "회원 복원 완료");
				mv.addObject("url", "/admin/userdetail?userId="+userId);
				mv.setViewName("common/message");
				//탈퇴시킬때 회원 강제 로그아웃 시키려면?
				
			}else {
				mv.addObject("msg", "회원 복원을 완료하지 못했습니다.");
				mv.addObject("url", "/user/userdetail");
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "회원 복원 실패");
			mv.addObject("url", "/user/userdetail");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	//회원상세-지꾸목록
//	@GetMapping("/admin/usersjiqoolist")
//	public ModelAndView showUserJiqooList(ModelAndView mv
//										, @ModelAttribute Jiqoo jiqoo
//										, @ModelAttribute User user
//										, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
//		// SELECT COUNT (*) FROM JIQOO_TBL WHERE JIQOO_WRITER = ?  //회원별 총 지꾸수
//		// SELECT * FROM JIQOO_TBL WHERE JIQOO_WRITER = ? ORDER BY JIQOO_NO DESC  // 회원별 지꾸 리스트
//
//		Integer totalUsersJiqooCount = adminService.getUserJiqooListCount(jiqoo); // 회원별 총 지꾸 수
//		PageInfo pInfo = this.getPageInfo(10, currentPage, totalUsersJiqooCount);
//		List<Jiqoo> uJiqooList = adminService.showUserJiqooList(pInfo); // 회원별 지꾸 리스트
//
//		try {
//			if (uJiqooList.size() > 0) {
//				mv.addObject("totalUsersJiqooCount", totalUsersJiqooCount);
//				mv.addObject("uJiqooList", uJiqooList);
//				mv.addObject("pInfo", pInfo);
//				mv.setViewName("admin/admin_user_detail");
//			} else {
//				mv.addObject("msg", "등록한 지꾸가 없습니다.");
//				mv.addObject("url", "/admin/main");
//				mv.setViewName("common/message");
//			}
//
//		} catch (Exception e) {
//			mv.addObject("msg", "지꾸 조회 실패");
//			mv.addObject("url", "/index.jsp");
//			mv.setViewName("common/message");
//		}
//		return mv;
//	}
	
	//회원 상세(+지꾸목록, 모꾸목록, 댓글목록)
	@GetMapping("/admin/userdetail")
	public ModelAndView showAdminUserDetail(ModelAndView mv
										  , @RequestParam("userId") String userId
										  , @ModelAttribute Jiqoo jiqoo
										  , @ModelAttribute Moqoo moqoo
										  , @RequestParam(value = "jiqooPage", required = false, defaultValue = "1") Integer currentJiqooPage
										  , @RequestParam(value = "moqooPage", required = false, defaultValue = "1") Integer currentMoqooPage) {
		// SELECT * FROM USER_TBL WHERE USER_ID = ?
		// SELECT * FROM JIQOO_TBL JOIN USER_TBL ON JIQOO_TBL.JIQOO_WRITER = USER_TBL.USER_ID WHERE USER_ID = #{userId}
		try {
			//회원 정보 가져오기
			User user = adminService.selectUserByUserId(userId);
			
			if (user != null) {
				//지꾸 정보 가져오기 
				Integer usersTotalJiqooCount = adminService.getUserJiqooListCount(userId); // 회원별 총 지꾸 수 카운트
				PageInfo pInfoJiqoo = this.getPageInfo(5, currentJiqooPage, usersTotalJiqooCount); // 지꾸 리스트 페이징 
				List<Jiqoo> uJiqooList = adminService.showUserJiqooList(pInfoJiqoo, userId); // 회원별 지꾸 리스트
				
				if(uJiqooList.size() > 0) {
					mv.addObject("pInfoJiqoo",  pInfoJiqoo).addObject("uJiqooList", uJiqooList);	
				}else {
					mv.addObject("noJiqooMsg", "등록한 지꾸가 없습니다.");
				}
				
				//모꾸 정보 가져오기 
				Integer usersTotalMoqooCount = adminService.getUserMoqooListCount(userId); // 회원별 총 모꾸 수 카운트
				PageInfo pInfoMoqoo = this.getPageInfo(5, currentMoqooPage, usersTotalMoqooCount); // 모꾸 리스트 페이징 
				List<Moqoo> uMoqooList = adminService.showUserMoqooList(pInfoMoqoo, userId); // 회원별 모꾸 리스트
				
				if(uMoqooList.size() > 0) {
					mv.addObject("pInfoMoqoo",  pInfoMoqoo).addObject("uMoqooList", uMoqooList);	
				}else {
					mv.addObject("noMoqooMsg", "등록한 모꾸가 없습니다.");
				}
						
				mv.addObject("user", user);
				mv.addObject("usersTotalJiqooCount", usersTotalJiqooCount);

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
