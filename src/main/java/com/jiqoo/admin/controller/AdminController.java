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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jiqoo.admin.service.AdminService;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.chat.service.ChatService;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.user.domain.User;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	//User 도메인에 count, ageGroup 추가하기
	// 관리자페이지 메인 접속+차트
	

	// 회원관리 리스트-총 회원리스트 (+페이징)
	@GetMapping("/admin/userlist")
	public ModelAndView showAdminUser(ModelAndView mv
									, @ModelAttribute User user
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		// SELECT COUNT (*) FROM USER_TBL;
		// SELECT * FROM USER_TBL ORDER BY U_CREATE_DATE DESC

		Integer totalUserCount = adminService.getUserListCount(); // 총 회원 수
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalUserCount);
		List<User> userList = adminService.selectAllUser(pInfo); // 전체회원리스트
//		User userOne = adminService.selectOneUser(user); //왜 널이지? 
//		System.out.println(userOne);
		

		try {
			if (userList.size() > 0) {
				mv.addObject("userList", userList);
				mv.addObject("pInfo", pInfo);
//				mv.addObject("userOne", userOne);
				mv.setViewName("admin/admin_user");
			} else {
				mv.addObject("msg", "가입한 회원이 없습니다.");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "전체 회원 조회 실패");
			mv.addObject("url", "/admin/main");
			mv.setViewName("common/message");
		}
		return mv;
	}

	// 회원관리_서치페이지 (+페이징)
	@GetMapping("/admin/usersearch")
	public ModelAndView SearchAdminUserList(ModelAndView mv
										, @RequestParam("searchCondition") String searchCondition
										, @RequestParam("searchKeyword") String searchKeyword
										, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {

		Map<String, String> searchUserMap = new HashMap<String, String>();
		searchUserMap.put("searchCondition", searchCondition);
		searchUserMap.put("searchKeyword", searchKeyword);

		// 서치.jsp 페이징처리
		Integer totalSearchUserCount = adminService.getUserSearchListCount(searchUserMap); // 검색한 총 회원 수
		PageInfo pInfo = this.getPageInfo(15, currentPage, totalSearchUserCount);
		
		//검색한 회원 리스트  
		List<User> searchUserList = adminService.searchUserByKeyword(pInfo, searchUserMap);

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

	
	//회원강제탈퇴
	@GetMapping("/admin/userdelete")
	public ModelAndView deleteUserByAdmin (ModelAndView mv
										, @RequestParam("userId") String userId) {
		//UPDATE USER_TBL SET USER_STATUS = 'A' WHERE USER_ID = ?
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
	
	//강제탈퇴 회원복원
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
	

	//회원 상세(+지꾸목록, 모꾸목록)
	@GetMapping("/admin/userdetail")
	public ModelAndView showAdminUserDetail(ModelAndView mv
										  , @RequestParam("userId") String userId
										  , @ModelAttribute Jiqoo jiqoo
										  , @ModelAttribute Moqoo moqoo
										  , @RequestParam(value = "jiqooPage", required = false, defaultValue = "1") Integer currentJiqooPage
										  , @RequestParam(value = "moqooPage", required = false, defaultValue = "1") Integer currentMoqooPage
										  , @RequestParam(value = "comtPage", required = false, defaultValue = "1") Integer currentComtPage) {
		// SELECT * FROM USER_TBL WHERE USER_ID = ?
		// SELECT * FROM JIQOO_TBL JOIN USER_TBL ON JIQOO_TBL.JIQOO_WRITER = USER_TBL.USER_ID WHERE USER_ID = #{userId}
		try {
			//회원 정보 가져오기
			User user = adminService.selectUserByUserId(userId);
			
			if (user != null) {
				//회원별 지꾸 정보 가져오기 
				Integer usersTotalJiqooCount = adminService.getUserJiqooListCount(userId); // 회원별 총 지꾸 수 카운트
				PageInfo pInfoJiqoo = this.getPageInfo(5, currentJiqooPage, usersTotalJiqooCount); // 지꾸 리스트 페이징 
				List<Jiqoo> uJiqooList = adminService.showUserJiqooList(pInfoJiqoo, userId); // 회원별 지꾸 리스트
				
				if(uJiqooList.size() > 0) {
					mv.addObject("pInfoJiqoo",  pInfoJiqoo).addObject("uJiqooList", uJiqooList);	
				}else {
					mv.addObject("noJiqooMsg", "작성한 지꾸가 없습니다.");
				}
				
				//회원별 모꾸 정보 가져오기 
				Integer usersTotalMoqooCount = adminService.getUserMoqooListCount(userId); // 회원별 총 모꾸 수 카운트
				PageInfo pInfoMoqoo = this.getPageInfo(5, currentMoqooPage, usersTotalMoqooCount); // 모꾸 리스트 페이징 
				List<Moqoo> uMoqooList = adminService.showUserMoqooList(pInfoMoqoo, userId); // 회원별 모꾸 리스트
				
				if(uMoqooList.size() > 0) {
					mv.addObject("pInfoMoqoo",  pInfoMoqoo).addObject("uMoqooList", uMoqooList);	
				}else {
					mv.addObject("noMoqooMsg", "작성한 모꾸가 없습니다.");
				}
				
				//회원별 댓글 정보 가져오기 
				Integer usersTotalComtCount = adminService.getusersTotalComtCount(userId); // 회원별 총 댓글 수 카운트
				PageInfo pInfoComt = this.getPageInfo(5, currentComtPage, usersTotalComtCount); // 지꾸 댓글 페이징 
				List<Comment> uComtList = adminService.showUserComtList(pInfoComt, userId); // 회원별 댓글 리스트
				
				if(uComtList.size() > 0) {
					mv.addObject("pInfoComt",  pInfoComt).addObject("uComtList", uComtList);	
				}else {
					mv.addObject("noComtMsg", "작성한 댓글이 없습니다.");
				}
						
				mv.addObject("user", user);
				mv.addObject("usersTotalJiqooCount", usersTotalJiqooCount);
				mv.addObject("usersTotalMoqooCount", usersTotalMoqooCount);
				mv.addObject("usersTotalComtCount", usersTotalComtCount);

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
	
//**지꾸****지꾸*****지꾸************************************************************************************************************************//
	
	// 지꾸관리 리스트 (+페이징)
	@GetMapping("/admin/jiqoo")
	public ModelAndView showAdminJiqoo(ModelAndView mv
									, @ModelAttribute Jiqoo jiqoo
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		// SELECT COUNT (*) FROM JIQOO_TBL   // 총 지꾸 수 
		// SELECT * FROM JIQOO_TBL ORDER BY JIQOO_NO DESC  // 총 지꾸 리스트 
		
		
		Integer totalJiqooCount = adminService.getJiqooListCount(); // 총 지꾸 수 
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalJiqooCount);
		List<Jiqoo> jiqooList = adminService.selectAllJiqoo(pInfo); // 전체 지꾸 리스트
//		Jiqoo jiqooOne = adminService.selectOneJiqoo(jiqoo); 
		
		try {
			if (jiqooList.size() > 0) {
				mv.addObject("jiqooList", jiqooList);
//				mv.addObject("jiqooOne", jiqooOne);
				mv.addObject("pInfo", pInfo);
				mv.addObject("totalJiqooCount", totalJiqooCount);
				mv.setViewName("admin/admin_jiqoo");
			} else {
				mv.addObject("msg", "등록된 지꾸가 없습니다.");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}
		} catch (Exception e) {
			mv.addObject("msg", "전체 회원 조회 실패");
			mv.addObject("url", "/admin/main");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	// 지꾸관리_서치페이지 (+페이징)
	@GetMapping("/admin/jiqoosearch")
	public ModelAndView SearchAdminJiqooList(ModelAndView mv
											, @RequestParam("searchCondition") String searchCondition
											, @RequestParam("searchKeyword") String searchKeyword
											, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		
		Map<String, String> searchJiqooMap = new HashMap<String, String>();
		searchJiqooMap.put("searchCondition", searchCondition);
		searchJiqooMap.put("searchKeyword", searchKeyword);
		
		// 지꾸서치.jsp 페이징처리
		Integer totalSearchJiqooCount = adminService.getJiqooSearchListCount(searchJiqooMap); // 검색된 총 지꾸 수
		PageInfo pInfo = this.getPageInfo(15, currentPage, totalSearchJiqooCount);

		List<Jiqoo> searchJiqooList = adminService.searchJiqooByKeyword(pInfo, searchJiqooMap);
		
		try {
			if (searchJiqooList.size() > 0) {
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);

				// 검색결과 페이징
				mv.addObject("pInfo", pInfo);
				mv.addObject("searchJiqooList", searchJiqooList);

				mv.setViewName("admin/search_admin_jiqoo");

			} else {
				mv.addObject("msg", "검색된 지꾸가 없습니다.");
				mv.addObject("url", "/admin/jiqoo");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "검색 실패");
			mv.addObject("url", "/admin/jiqoo");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	// 지꾸관리_강제삭제
	@ResponseBody
	@GetMapping("/admin/deletejiqoo")
	public ModelAndView deleteJiqooByAdmin (ModelAndView mv
											, @RequestParam(value="jiqooNo") Integer jiqooNo
											, HttpSession session) {
		//UPDATE JIQOO_TBL SET J_OPEN_STATUS = 'N', JIQOO_STATUS ='A'  WHERE JIQOO_NO = ?
	
//			Integer result = adminService.deleteJiqooByAdmin(jiqoo);
//			if(result>0) {
//				return "success";
//			
//			}else {
//				return "fail";
//			}
			
			try {
				String adminYn = (String)session.getAttribute("adminYn"); 
				
//				Jiqoo jiqoo = new Jiqoo();
//				jiqoo.setJiqooNo(jiqooNo);  //없어도 되긴 함 
				
				if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 삭제할수 있도록
					Integer result = adminService.deleteJiqooByAdmin(jiqooNo);
					if(result>0) {
						mv.addObject("msg", "지꾸 삭제 완료");
						mv.addObject("url", "/admin/jiqoo");
						mv.setViewName("common/message");
						
					}else {
						
						mv.addObject("msg", "지꾸 삭제가 완료되지 않았습니다");
						mv.addObject("url", "/admin/jiqoo");
						mv.setViewName("common/message");
					}
				}else {
					mv.addObject("msg", "관리자만 삭제할 수 있습니다");
					mv.addObject("url", "/");  //메인화면으로 돌아감
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				mv.addObject("msg", "지꾸 삭제 실패");
				mv.addObject("url", "/admin/jiqoo");
				mv.setViewName("common/message");
			}
			return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//**모꾸***모꾸***모꾸****************************************************************************************************************//	

	// 모꾸관리 리스트 (+페이징)
		@GetMapping("/admin/moqoo")
		public ModelAndView showAdminMoqoo(ModelAndView mv
										, @ModelAttribute Moqoo moqoo
										, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
			// SELECT COUNT (*) FROM MOQOO_TBL   // 총 모꾸 수 
			// SELECT * FROM MOQOO_TBL ORDER BY MOQOO_NO DESC  // 총 모꾸 리스트 
			
			
			Integer totalMoqooCount = adminService.getMoqooListCount(); // 총 모꾸 수 
			PageInfo pInfo = this.getPageInfo(10, currentPage, totalMoqooCount);
			List<Moqoo> moqooList = adminService.selectAllMoqoo(pInfo); // 전체 모꾸 리스트
			
			try {
				if (moqooList.size() > 0) {
					mv.addObject("moqooList", moqooList);
					mv.addObject("pInfo", pInfo);
					mv.addObject("totalMoqooCount", totalMoqooCount);
					mv.setViewName("admin/admin_moqoo");
				} else {
					mv.addObject("msg", "등록된 모꾸가 없습니다.");
					mv.addObject("url", "/admin/main");
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				mv.addObject("msg", "전체 모꾸 조회 실패");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}
			return mv;
		}

		
		
		
		// 모꾸관리_서치페이지 (+페이징)
		@GetMapping("/admin/moqoosearch")
		public ModelAndView SearchAdminMoqooList(ModelAndView mv
												, @RequestParam("searchCondition") String searchCondition
												, @RequestParam("searchKeyword") String searchKeyword
												, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
			
			Map<String, String> searchMoqooMap = new HashMap<String, String>();
			searchMoqooMap.put("searchCondition", searchCondition);
			searchMoqooMap.put("searchKeyword", searchKeyword);
			
			// 모꾸서치.jsp 페이징처리
			Integer totalSearchMoqooCount = adminService.getMoqooSearchListCount(searchMoqooMap); // 검색된 총 모꾸 수
			PageInfo pInfo = this.getPageInfo(15, currentPage, totalSearchMoqooCount);

			List<Moqoo> searchMoqooList = adminService.searchMoqooByKeyword(pInfo, searchMoqooMap); //검색된 모꾸 리스트 
			
			try {
				if (searchMoqooList.size() > 0) {
					mv.addObject("searchCondition", searchCondition);
					mv.addObject("searchKeyword", searchKeyword);

					// 검색결과 페이징
					mv.addObject("pInfo", pInfo);
					mv.addObject("searchMoqooList", searchMoqooList);

					mv.setViewName("admin/search_admin_moqoo");

				} else {
					mv.addObject("msg", "검색된 모꾸가 없습니다.");
					mv.addObject("url", "/admin/moqoo");
					mv.setViewName("common/message");
				}

			} catch (Exception e) {
				mv.addObject("msg", "검색 실패");
				mv.addObject("url", "/admin/jiqoo");
				mv.setViewName("common/message");
			}
			return mv;
		}
		
		
		// 모꾸관리_강제삭제 //안됨
		@GetMapping("/admin/deletemoqoo")
		public ModelAndView deleteMoqooByAdmin (ModelAndView mv
												, @RequestParam(value="moqooNo") Integer moqooNo
												, HttpSession session) {
			//UPDATE MOQOO_TBL SET MOQOO_STATUS ='A'  WHERE MOQOO_NO = ?
						
				try {
					String adminYn = (String)session.getAttribute("adminYn"); 
					
//					Moqoo moqoo = new Moqoo();
//					moqoo.setMoqooNo(moqooNo);  //이거 왜 쓰는거지?;
					
					if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 삭제할수 있도록
						Integer result = adminService.deleteMoqooByAdmin(moqooNo);
						if(result>0) {
							mv.addObject("msg", "모꾸 삭제 완료");
							mv.addObject("url", "/admin/moqoo");
							mv.setViewName("common/message");
							
						}else {
							
							mv.addObject("msg", "모꾸 삭제가 완료되지 않았습니다");
							mv.addObject("url", "/admin/moqoo");
							mv.setViewName("common/message");
						}
					}else {
						mv.addObject("msg", "관리자만 삭제할 수 있습니다");
						mv.addObject("url", "/");  //메인화면으로 돌아감
						mv.setViewName("common/message");
					}
				} catch (Exception e) {
					mv.addObject("msg", "모꾸 삭제 실패");
					mv.addObject("url", "/admin/moqoo");
					mv.setViewName("common/message");
				}
				return mv;
		}
		
		
//**채팅***채팅***채팅****************************************************************************************************************//	
		
	// 채팅방관리_ 리스트 접속(+페이징)  //안됨
	@GetMapping("/admin/chat")
	public ModelAndView showAdminChat(ModelAndView mv
									, HttpSession session
									, @ModelAttribute ChatRoom chatRoom
									, @ModelAttribute ChatUser chatUser
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		// SELECT COUNT (*) FROM CHAT_ROOM_TBL;
		// SELECT * FROM CHAT_ROOM_TBL ORDER BY C_CREATE_DATE DESC
		Integer totalChatRoomCount = adminService.getChatRoomListCount(); // 총 채팅방 수
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalChatRoomCount);
		List<ChatRoom>chatRoomList = adminService.selectAllChatRoom(pInfo); // 전체 채팅방 리스트
		
		

	
		
		try {
			if (chatRoomList.size() > 0) {
				mv.addObject("chatRoomList", chatRoomList);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("admin/admin_chat");
			} else {
				mv.addObject("msg", "아직 만들어진 채팅방이 없습니다.");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "전체 채팅방 스트 조회 실패");
			mv.addObject("url", "/admin/main");
			mv.setViewName("common/message");
		}
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
