package com.jiqoo.admin.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
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
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jiqoo.admin.service.AdminService;
import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.chat.service.ChatService;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.common.domain.PageInfo;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.moqoo.domain.Moqoo;
import com.jiqoo.report.domain.Report;
import com.jiqoo.report.service.ReportService;
import com.jiqoo.user.domain.User;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private ChatService chatService;

	// 관리자페이지 메인 접속+차트
	@GetMapping("/admin/main")
	public ModelAndView showAdminMain(ModelAndView mv
									, @ModelAttribute Jiqoo jiqoo
									, @ModelAttribute Moqoo moqoo
									, @ModelAttribute User user
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		Integer usingJiqooCount = adminService.usingJiqooCount(jiqoo);  //6일이후 생성~ 유지중인 지꾸 총 개수
		Integer usingMoqooCount = adminService.usingMoqooCount(moqoo);  //6일이후 생성~ 유지중인 모꾸 총 개수
		
		// 6일이후~ 현재 가입중인 회원 성비 
		List<User> userGenderList = adminService.userGenderList();
		//당일 등록된 지꾸 수 
		Integer todayInsertJiqooCount = adminService.todayInsertJiqooCount();
		//전일 등록된 지꾸 수 
		Integer yesterdayInsertJiqooCount = adminService.yesterdayInsertJiqooCount();
		//당일 등록된 모꾸 수 
		Integer todayInsertMoqooCount = adminService.todayInsertMoqooCount();
		//전일 등록된 모꾸 수 
		Integer yesterdayInsertMoqooCount = adminService.yesterdayInsertMoqooCount();
				
		//당일 가입한 회원 수 
		Integer todayJoinUserCount = adminService.todayJoinUserCount();
		//전일 가입한 회원 수 
		Integer yesterdayJoinUserCount = adminService.yesterdayJoinUserCount();
		
		Integer todayUserCount = adminService.getUserListCount(); // 당일 가입 회원 수
		Integer todayJiqooCount = adminService.getUserListCount(); // 당일 등록 지꾸 수
		PageInfo pInfoUser = this.getPageInfo(3, currentPage, todayUserCount);
		PageInfo pInfoJiqoo = this.getPageInfo(4, currentPage, todayJiqooCount);
		
		//당일 가입한 회원 리스트(+페이징)
		List<User> todayUserList = adminService.todayUserList(pInfoUser);
		
		//당일 등록된 지꾸 리스트 (+페이징)
		List<Jiqoo> todayJiqooList = adminService.todayJiqooList(pInfoJiqoo);
		
		//당일 등록된 모꾸 리스트 (+페이징)
		List<Moqoo> todayMoqooList = adminService.todayMoqooList(pInfoJiqoo);
		
		//당일 등록된 댓글 리스트 (+페이징)
		List<Comment> todayComtList = adminService.todayComtList(pInfoJiqoo);
		
		// 현재 가입중인 회원 나이대 비 
		List<User> userAgeList = adminService.userAgeList();

		
		
		//성비 리스트(차트) **************************************************************
		Gson genderGson = new Gson();
		JsonArray genderArray = new JsonArray();
		Iterator<User> userGenderIt = userGenderList.iterator();
		
		while(userGenderIt.hasNext()) {
			User Gender = userGenderIt.next();
			JsonObject genderObject = new JsonObject();
			String userGender = Gender.getUserGender();
			int count = Gender.getCount();
			
			
			genderObject.addProperty("userGender", userGender);
			genderObject.addProperty("count", count);
			genderArray.add(genderObject);
		}
		String userGendergroup = genderGson.toJson(genderArray);
		
		//나이 비율 리스트(차트) **************************************************************
		Gson ageGson = new Gson();
		JsonArray ageArray = new JsonArray();
		Iterator<User> userAgeIt = userAgeList.iterator();
		
		while(userAgeIt.hasNext()) {
			User age = userAgeIt.next();
			JsonObject ageObject = new JsonObject();
			
			String ageGroup = age.getAgeGroup(); 
			int count = age.getCount();

			ageObject.addProperty("ageGroup", ageGroup);
			ageObject.addProperty("count", count);
			ageArray.add(ageObject);
		}
		String userBirthGroup = ageGson.toJson(ageArray);
		
		Map<String,Object>statsMap = new HashMap<>();
		statsMap.put("user", user);
		statsMap.put("jiqoo", jiqoo);
		statsMap.put("moqoo", moqoo);
		
		List<Map<String,Object>> dayCountList = adminService.dayCountList(statsMap);
			
		try {
			mv.addObject("usingJiqooCount", usingJiqooCount); //유지중인 지꾸 수 
			mv.addObject("usingMoqooCount", usingMoqooCount); //유지중인 모꾸 수 
			mv.addObject("userGendergroup", userGendergroup); // 유지회원 성비 
			mv.addObject("userBirthGroup", userBirthGroup); // 유지회원 나이비 
			mv.addObject("todayInsertJiqooCount", todayInsertJiqooCount);  //당일 등록된 지꾸 수  
			mv.addObject("yesterdayInsertJiqooCount", yesterdayInsertJiqooCount);  //전일 등록된 지꾸 수 
			mv.addObject("todayInsertMoqooCount", todayInsertMoqooCount);  //당일 등록된 모꾸 수  
			mv.addObject("yesterdayInsertMoqooCount", yesterdayInsertMoqooCount);  //전일 등록된 모꾸 수 
			mv.addObject("todayJoinUserCount", todayJoinUserCount); // 당일 가입한 회원수 
			mv.addObject("yesterdayJoinUserCount", yesterdayJoinUserCount); //전일 가입한 회원 수 
			mv.addObject("todayUserList", todayUserList); //당일 가입한 회원 리스트
			mv.addObject("todayJiqooList", todayJiqooList); //당일 등록된 지꾸 리스트
			mv.addObject("todayMoqooList", todayMoqooList); //당일 등록된 모꾸 리스트
			mv.addObject("todayComtList", todayComtList); //당일 등록된 댓글 리스트
			mv.addObject("dayCountList", dayCountList); //날짜별 지꾸 모꾸 회원 등록수 리스트
			
			mv.setViewName("admin/admin_main");
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자페이지 조회 실패");
			mv.addObject("url", "/");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	
		//통합차트_날짜별 지꾸모꾸회원 등록수 리스트
		@ResponseBody
		@GetMapping("/admin/statschart")
		public String statschart(User user, Jiqoo jiqoo, Moqoo moqoo) {
			
			//유저카운트만 쓰는 리스트맵	
//			List<Map<String,Object>> userCountList = adminService.userCountList(user);
//			
//			Gson gson = new Gson();
//			return gson.toJson(userCountList);
			
			Map<String,Object>statsMap = new HashMap<>();
			statsMap.put("user", user);
			statsMap.put("jiqoo", jiqoo);
			statsMap.put("moqoo", moqoo);
			
			List<Map<String,Object>> dayCountList = adminService.dayCountList(statsMap); //날짜별 지꾸 모꾸 회원 등록수 리스트

			Gson gson = new Gson();
			return gson.toJson(dayCountList);
			
			
		}
		
		//메인_지꾸카드_데일리 
		@ResponseBody
		@GetMapping("/admin/dailyjiqoocard")
		public Map<String, Integer> todayInsertJiqooCount(@ModelAttribute Jiqoo jiqoo) {	
			
			//이번주 등록된 지꾸 수 
			Integer resultTodayCnt = adminService.todayInsertJiqooCount();
			Integer resultYesterdayCnt = adminService.yesterdayInsertJiqooCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultTodayCnt", resultTodayCnt);
			jiqooCntData.put("resultYesterdayCnt", resultYesterdayCnt);
			return jiqooCntData;
		}
		
		//메인_지꾸카드_위클리 
		@ResponseBody
		@GetMapping("/admin/weeklyjiqoocard")
		public Map<String, Integer> thisWeekInsertJiqooCount(@ModelAttribute Jiqoo jiqoo) {	
			
			//이번주 등록된 지꾸 수 
			Integer resultThisWeekCnt = adminService.thisWeekInsertJiqooCount();
			//지난주 등록된 지꾸 수
			Integer resultlastWeekCnt = adminService.lastWeekInsertJiqooCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultThisWeekCnt", resultThisWeekCnt);
			jiqooCntData.put("resultlastWeekCnt", resultlastWeekCnt);
			return jiqooCntData;
		}
		
		//메인_모꾸카드_데일리 
		@ResponseBody
		@GetMapping("/admin/dailymoqoocard")
		public Map<String, Integer> todayInsertMoqooCount(@ModelAttribute Moqoo moqoo) {	
			
			//오늘 등록된 모꾸 수 
			Integer resultTodayCnt = adminService.todayInsertMoqooCount();
			//어제 등록된 모꾸 수
			Integer resultYesterdayCnt = adminService.yesterdayInsertMoqooCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultTodayCnt", resultTodayCnt);
			jiqooCntData.put("resultYesterdayCnt", resultYesterdayCnt);
			return jiqooCntData;
		}
		
		//메인_모꾸카드_위클리 
		@ResponseBody
		@GetMapping("/admin/weeklymoqoocard")
		public Map<String, Integer> thisWeekInsertMoqooCount(@ModelAttribute Moqoo moqoo) {	
			
			//이번주 등록된 모꾸 수 
			Integer resultThisWeekCnt = adminService.thisWeekInsertMoqooCount();
			//지난주 등록된 모꾸 수
			Integer resultlastWeekCnt = adminService.lastWeekInsertMoqooCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultThisWeekCnt", resultThisWeekCnt);
			jiqooCntData.put("resultlastWeekCnt", resultlastWeekCnt);
			return jiqooCntData;
		}
	
		//메인_회원카드_데일리 
		@ResponseBody
		@GetMapping("/admin/dailyusercard")
		public Map<String, Integer> todayInsertUserCount(@ModelAttribute User uer) {	
			
			//당일 가입한 회원 수
			Integer resultTodayCnt = adminService.todayJoinUserCount();
			//전일 가입한 회원 수
			Integer resultYesterdayCnt = adminService.yesterdayJoinUserCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultTodayCnt", resultTodayCnt);
			jiqooCntData.put("resultYesterdayCnt", resultYesterdayCnt);
			return jiqooCntData;
		}
		
		//메인_회원카드_위클리 
		@ResponseBody
		@GetMapping("/admin/weeklyusercard")
		public Map<String, Integer> thisWeekInsertUserCount(@ModelAttribute User uer) {	
			
			//이번주 가입한 회원수 
			Integer resultThisWeekCnt = adminService.thisWeekJoinUserCount();
			//지난주 가입한 회원 수
			Integer resultlastWeekCnt = adminService.lastWeekJoinUserCount();

			Map<String, Integer> jiqooCntData = new HashMap<String, Integer>();
			jiqooCntData.put("resultThisWeekCnt", resultThisWeekCnt);
			jiqooCntData.put("resultlastWeekCnt", resultlastWeekCnt);
			return jiqooCntData;
		}
		
		
		
		
		
		
		

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
				mv.addObject("msg", "검색 결과가 없습니다");
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
	

	//회원 상세(+지꾸목록, 모꾸목록, 댓글목록) => 에이젝스로 바꾸기 
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
			
//			for(int i = 0; i < user.getReportList().size(); i++) {
//				Report report = user.getReportList().get(i);
//				String reportContent = report.getReportContent();
//			}
			
			
			if (user != null) {
				//회원별 지꾸 정보 가져오기 
				Integer usersTotalJiqooCount = adminService.getUserJiqooListCount(userId); // 회원별 총 지꾸 수 카운트
				PageInfo pInfoJiqoo = this.getPageInfo(5, currentJiqooPage, usersTotalJiqooCount); // 지꾸 리스트 페이징 
				List<Jiqoo> jiqooList = adminService.showUserJiqooList(pInfoJiqoo, userId); // 회원별 지꾸 리스트
				
				if(jiqooList.size() > 0) {
					mv.addObject("pInfoJiqoo",  pInfoJiqoo).addObject("jiqooList", jiqooList);	
				}else {
					mv.addObject("noJiqooMsg", "작성한 지꾸가 없습니다.");
				}
				
				//회원별 모꾸 정보 가져오기 
				Integer usersTotalMoqooCount = adminService.getUserMoqooListCount(userId); // 회원별 총 모꾸 수 카운트
				PageInfo pInfoMoqoo = this.getPageInfo(5, currentMoqooPage, usersTotalMoqooCount); // 모꾸 리스트 페이징 
				List<Moqoo> moqooList = adminService.showUserMoqooList(pInfoMoqoo, userId); // 회원별 모꾸 리스트
				
				if(moqooList.size() > 0) {
					mv.addObject("pInfoMoqoo", pInfoMoqoo).addObject("moqooList", moqooList);	
				}else {
					mv.addObject("noMoqooMsg", "작성한 모꾸가 없습니다.");
				}
				
				//회원별 댓글 정보 가져오기 
				Integer usersTotalComtCount = adminService.getusersTotalComtCount(userId); // 회원별 총 댓글 수 카운트
				PageInfo pInfoComt = this.getPageInfo(5, currentComtPage, usersTotalComtCount); // 지꾸 댓글 페이징 
				List<Comment> comtList = adminService.showUserComtList(pInfoComt, userId); // 회원별 댓글 리스트
				
//				if(comtList.size() > 0) {
//					mv.addObject("pInfoComt", pInfoComt).addObject("comtList", comtList);	
//				}else {
//					mv.addObject("noComtMsg", "작성한 댓글이 없습니다.");
//				}
				
//				for (User userReport : user) {
//					List<Report> originalText = userReport.getReportList(); 
//					List<Report> replacedText = originalText.replaceA("대체전단어", "대체후단어");
//				    user.setReportList(replacedText);
//				}
						
				mv.addObject("user", user);
				mv.addObject("comtList", comtList);
				mv.addObject("usersTotalJiqooCount", usersTotalJiqooCount); //회원별 작성한 지꾸 수 
				mv.addObject("usersTotalMoqooCount", usersTotalMoqooCount); //회원별 작성한 모꾸 수 
				mv.addObject("usersTotalComtCount", usersTotalComtCount);  // 회원별 작성한 댓글 수 

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
	
	//회원상세_댓글(ajax)
	@ResponseBody
	@GetMapping(value="/admin/u_detail_comtlist"
			  , produces="application/json;charset=utf-8")
	public String showComtList(@RequestParam("userId") String userId
							 , @RequestParam(value = "comtPage", required = false, defaultValue = "1") Integer currentComtPage) { 
		Integer usersTotalComtCount = adminService.getusersTotalComtCount(userId); // 회원별 총 댓글 수 카운트
		PageInfo pInfoComt = this.getPageInfo(5, currentComtPage, usersTotalComtCount); // 지꾸 댓글 페이징 
		List<Comment> comtList = adminService.showUserComtList(pInfoComt, userId); // 회원별 댓글 리스트

		Gson gson = new Gson();
		return gson.toJson(comtList);
	}

	
	
	
	
	
	
	
	
	
	// 회원상세_지꾸강제삭제 + 지꾸관리페이지 지꾸 강제삭제 
	@GetMapping("/admin/deletejiqoo")
	public ModelAndView deleteJiqooByAdmin (ModelAndView mv
											, @RequestParam(value="jiqooNo") Integer jiqooNo
											, @RequestParam(value="userId", required=false) String userId
											, HttpSession session) {
		//UPDATE JIQOO_TBL SET JIQOO_STATUS ='A'  WHERE JIQOO_NO = ?
			
			try {
				String adminYn = (String)session.getAttribute("adminYn"); 
				
				if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 삭제할수 있도록
					Integer result = adminService.deleteJiqooByAdmin(jiqooNo);
					
					if(result>0) {
						
						if(userId != null ) {
							mv.addObject("url", "/admin/userdetail?userId=" + userId);
							
						}else {
							mv.addObject("url", "/admin/jiqoolist");
						}
						
						mv.addObject("msg", "지꾸 삭제 완료");
						mv.setViewName("common/message");
						
					}else {
						
						if(userId != null ) {
							mv.addObject("url", "/admin/userdetail?userId=" + userId);
							
						}else {
							mv.addObject("url", "/admin/jiqoolist");
						}
						
						mv.addObject("msg", "지꾸 삭제가 완료되지 않았습니다");
						mv.setViewName("common/message");
					}
				}else {
					mv.addObject("msg", "관리자만 삭제할 수 있습니다");
					mv.addObject("url", "/");  //메인화면으로 돌아감
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				
				if(userId != null ) {
					mv.addObject("url", "/admin/userdetail?userId=" + userId);
					
				}else {
					mv.addObject("url", "/admin/jiqoolist");
				}
				
				mv.addObject("msg", "지꾸 삭제 실패");
				mv.setViewName("common/message");
			}
			return mv;
	}
	
	
	// 회원상세 + 지꾸관리페이지 강제삭제 지꾸 복원
	@GetMapping("/admin/jiqoorevival")
	public ModelAndView reviveJiqooByAdmin (ModelAndView mv
								  		, @RequestParam("jiqooNo") String jiqooNo
								  		, @RequestParam(value="userId", required=false) String userId
								  		, HttpSession session) {
		//UPDATE JIQOO_TBL SET JIQOO_STATUS = 'Y' WHERE JIQOO_NO = ?
		try {
			String adminYn = (String)session.getAttribute("adminYn"); 
			
			if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 복원할수 있도록
				Integer result = adminService.reviveJiqooByAdmin(jiqooNo);
				
				if(result>0) {
					
					if(userId != null ) {  //회원상세에서 복원할때
						mv.addObject("url", "/admin/userdetail?userId=" + userId); //회원상세에서 복원할때 userId 필요 
						
					}else {
						mv.addObject("url", "/admin/jiqoolist"); //지꾸관리페이지 상세에서 복할 때 
					}
					mv.addObject("msg", "지꾸 복원 완료");
					mv.setViewName("common/message");
					
				}else { //리절트값을 못가져왔을때 
					if(userId != null ) {  //회원상세에서 복원할때 
						mv.addObject("url", "/admin/userdetail?userId=" + userId);
						
					}else {
						mv.addObject("url", "/admin/jiqoolist");
					}
					
					mv.addObject("msg", "지꾸 복원을 완료하지 못했습니다.");
					mv.setViewName("common/message");
				}
			}else {
				mv.addObject("msg", "관리자만 삭제할 수 있습니다");
				mv.addObject("url", "/");  //메인화면으로 돌아감
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "지꾸 복원 실패");
			mv.addObject("url", "/admin/jiqoolist");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	// 회원상세_모꾸강제삭제 + 모꾸관리페이지 모꾸 강제삭제 
	@GetMapping("/admin/deletemoqoo")
	public ModelAndView deleteMoqooByAdmin (ModelAndView mv
											, @RequestParam(value="moqooNo") Integer moqooNo
											, @RequestParam(value="userId", required=false) String userId
											, HttpSession session) {
		//UPDATE MOQOO_TBL SET MOQOO_STATUS ='A'  WHERE MOQOO_NO = ?
			
			try {
				String adminYn = (String)session.getAttribute("adminYn"); 
				
				if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 삭제할수 있도록
					Integer result = adminService.deleteMoqooByAdmin(moqooNo);
					
					if(result>0) {
						
						if(userId != null ) {
							mv.addObject("url", "/admin/userdetail?userId=" + userId); //회원상세에서 삭제할때 userId 필요 
							
						}else {
							mv.addObject("url", "/admin/moqoolist"); //모꾸관리페이지 상세에서 삭제할 때 
						}
						
						mv.addObject("msg", "모꾸 삭제 완료");
						mv.setViewName("common/message");
						
					}else {
						
						if(userId != null ) {
							mv.addObject("url", "/admin/userdetail?userId=" + userId);
							
						}else {
							mv.addObject("url", "/admin/moqoolist");
						}
						
						mv.addObject("msg", "모꾸 삭제가 완료되지 않았습니다");
						mv.setViewName("common/message");
					}
				}else {
					mv.addObject("msg", "관리자만 삭제할 수 있습니다");
					mv.addObject("url", "/");  //메인화면으로 돌아감
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				
				if(userId != null ) {
					mv.addObject("url", "/admin/userdetail?userId=" + userId);
					
				}else {
					mv.addObject("url", "/admin/moqoolist");
				}
				
				mv.addObject("msg", "모꾸 삭제 실패");
				mv.setViewName("common/message");
			}
			return mv;
	}
	
	
	
	// 회원상세 + 모꾸관리페이지 강제삭제 모꾸 복원 
	@GetMapping("/admin/moqoorevival")
	public ModelAndView reviveMoqooByAdmin (ModelAndView mv
								  		, @RequestParam("moqooNo") String moqooNo
								  		, @RequestParam(value="userId", required=false) String userId
								  		, HttpSession session) {
		//UPDATE MOQOO_TBL SET MOQOO_STATUS = 'Y' WHERE MOQOO_NO = ?
		try {
			String adminYn = (String)session.getAttribute("adminYn"); 
			
			if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 복원할수 있도록
				Integer result = adminService.reviveMoqooByAdmin(moqooNo);
				
				if(result>0) {
					
					if(userId != null ) {  //회원상세에서 복원할때
						mv.addObject("url", "/admin/userdetail?userId=" + userId); //회원상세에서 복원할때 userId 필요 
						
					}else {
						mv.addObject("url", "/admin/moqoolist"); //모꾸관리페이지 상세에서 복할 때 
					}
					
					mv.addObject("msg", "모꾸 복원 완료");
					mv.setViewName("common/message");
					
				}else {  //리절트값을 못가져왔을때 
					
					if(userId != null ) {  //회원상세에서 복원할때 
						mv.addObject("url", "/admin/userdetail?userId=" + userId);
						
					}else {
						mv.addObject("url", "/admin/moqoolist");
					}
					
					mv.addObject("msg", "모꾸 복원을 완료하지 못했습니다.");
					mv.setViewName("common/message");
				}
			}else {
				mv.addObject("msg", "관리자만 삭제할 수 있습니다");
				mv.addObject("url", "/");  //메인화면으로 돌아감
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "모꾸 복원 실패");
			mv.addObject("url", "/admin/moqoolist");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	// 회원상세_댓글관리_강제삭제
	@GetMapping("/admin/deletecomt")
	public ModelAndView deleteComtByAdmin (ModelAndView mv
											, @RequestParam(value="comtNo") Integer comtNo
											, @RequestParam(value="userId") String userId
											, HttpSession session) {
		//UPDATE COMT_TBL SET COMT_STATUS ='A'  WHERE COMT_NO = ?
			
			try {
				String adminYn = (String)session.getAttribute("adminYn"); 
				
				
				if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 삭제할수 있도록
					
					
					Integer result = adminService.deleteComtByAdmin(comtNo);
					if(result>0) {
						mv.addObject("msg", "댓글 삭제 완료");
						mv.addObject("url", "/admin/userdetail?userId=" + userId);
						mv.setViewName("common/message");
						
					}else {
						
						mv.addObject("msg", "댓글 삭제가 완료되지 않았습니다");
						mv.addObject("url", "/admin/userdetail?userId=" + userId);
						mv.setViewName("common/message");
					}
				}else {
					mv.addObject("msg", "관리자만 삭제할 수 있습니다");
					mv.addObject("url", "/");  //메인화면으로 돌아감
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				mv.addObject("msg", "댓글 삭제 실패");
				mv.addObject("url", "/admin/userdetail?userId=" + userId);
				mv.setViewName("common/message");
			}
			return mv;
	}
	
	// 회원상세 강제삭제 댓글 복원 
	@GetMapping("/admin/comtrevival")
	public ModelAndView reviveCommentByAdmin (ModelAndView mv
								  		, @RequestParam("comtNo") String comtNo
								  		, @RequestParam(value="userId", required=false) String userId
								  		, HttpSession session) {
		//UPDATE COMT_TBL SET COMT_STATUS ='Y'  WHERE COMT_NO = ?
		try {
			String adminYn = (String)session.getAttribute("adminYn"); 
			
			if(adminYn != null && adminYn.equals("Y")) {  //어드민일때 복원할수 있도록
				Integer result = adminService.reviveCommentByAdmin(comtNo);
				
				if(result>0) {
					
					mv.addObject("url", "/admin/userdetail?userId=" + userId); //회원상세에서 복원할때 userId 필요 
					mv.addObject("msg", "댓글 복원 완료");
					mv.setViewName("common/message");
					
				}else {  //리절트값을 못가져왔을때 
					
					mv.addObject("url", "/admin/userdetail?userId=" + userId);
					mv.addObject("msg", "댓글 복원을 완료하지 못했습니다.");
					mv.setViewName("common/message");
				}
			}else {
				mv.addObject("msg", "관리자만 복원할 수 있습니다");
				mv.addObject("url", "/");  //메인화면으로 돌아감
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "댓글 복원 실패");
			mv.addObject("url", "/admin/moqoolist");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	
	
//**지꾸****지꾸*****지꾸************************************************************************************************************************//
	
	//지꾸관리페이지_지꾸차트 
	@ResponseBody
	@GetMapping("/admin/jiqooChartLine")
	public String jiqoochart(User user, Jiqoo jiqoo) {
		
		Map<String,Object>statsMap = new HashMap<>();
		statsMap.put("user", user);
		statsMap.put("jiqoo", jiqoo);
		
		List<Map<String,Object>> jiqooCountList = adminService.jiqooCountList(jiqoo); //날짜별 지꾸 등록수 리스트

		Gson gson = new Gson();
		return gson.toJson(jiqooCountList);
		
//		List<Map<String,Object>> jiqooCountList = adminService.jiqooCountList(jiqoo);
//
//
//		Gson jiqooGson = new Gson();
//		JsonArray jiqooArray = new JsonArray();
//		Iterator<Jiqoo> jiqooIt = jiqooCntList.iterator();
//		
//		while(jiqooIt.hasNext()) {
//			Jiqoo jiqooCnt = jiqooIt.next();
//			JsonObject jiqooCntObject = new JsonObject();
//			String jiqooDate = jiqooCnt.getjCreateDate();
//			int count = jiqooCnt.getjReportCount();
//			
//			
//			jiqooCntObject.addProperty("userGender", userGender);
//			jiqooCntObject.addProperty("count", count);
//			jiqooArray.add(jiqooCntObject);
//		}
//		String userGendergroup = jiqooGson.toJson(jiqooArray);
		

		
	}
	
	
	// 지꾸관리 리스트 (+페이징)
	@GetMapping("/admin/jiqoolist")
	public ModelAndView showAdminJiqoo(ModelAndView mv
									, @ModelAttribute Jiqoo jiqoo
									, @ModelAttribute Report report
//									, @RequestParam int jiqooNo
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		// SELECT COUNT (*) FROM JIQOO_TBL   // 총 지꾸 수 
		// SELECT * FROM JIQOO_TBL ORDER BY JIQOO_NO DESC  // 총 지꾸 리스트 
		
		Integer totalJiqooCount = adminService.getJiqooListCount(); // 총 지꾸 수 
		PageInfo pInfo = this.getPageInfo(10, currentPage, totalJiqooCount);
		
		List<Jiqoo> jiqooList = adminService.selectAllJiqoo(pInfo); // 전체 지꾸 리스트(+신고수)
//		List<Report> jiqooReport = reportService.jiqooReportByJNoList(jiqooNo); // 지꾸 번호별 신고사유리스트 
		
		try {
			if (jiqooList.size() > 0) {
				mv.addObject("jiqooList", jiqooList);
				mv.addObject("pInfo", pInfo);
//				mv.addObject("totalJiqooCount", totalJiqooCount);
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

		List<Jiqoo> searchJiqooList = adminService.searchJiqooByKeyword(pInfo, searchJiqooMap); //검색된 지꾸 리스트 
		
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
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//**모꾸***모꾸***모꾸****************************************************************************************************************//	

	// 모꾸관리 리스트 (+페이징)
		@GetMapping("/admin/moqoolist")
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
//					mv.addObject("totalMoqooCount", totalMoqooCount);
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
		
		

		
		
		

		
		
		
		
		
		
//**채팅***채팅***채팅****************************************************************************************************************//	
		
	// 채팅방관리_ 리스트 접속(+페이징)  //안됨
	@GetMapping("/admin/chatlist")
	public ModelAndView showAdminChat(ModelAndView mv
									, HttpSession session
									, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {

//		List<User> userList = chatService.selectAllUserByChatNo(chatNo); //채팅방 별 참여자 
//		List<ChatMessage> sendMsgList = adminService.selectlastMsgByChatNo(); //마지막 채팅시간 
//		List<ChatRoom> chatRoomList = adminService.selectChatRoomList();  //채팅방리스트
	
		Integer chatRoomCount = adminService.getChatRoomListCount(); // 채팅방 수
		PageInfo pInfo = this.getPageInfo(15, currentPage, chatRoomCount);  //채팅방리스트 페이징
	
	//다있는 채팅방 리스트
		Map<String,Object>chatMap = new HashMap<>();
		List<Map<String, Object>>chatRoomAllList = adminService.selectChatRoomAllList(pInfo, chatMap);
	
		try {
			if (chatRoomAllList.size() > 0) {
				mv.addObject("chatRoomAllList", chatRoomAllList);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("admin/admin_chat");
			} else {
				mv.addObject("msg", "아직 만들어진 채팅방이 없습니다.");
				mv.addObject("url", "/admin/main");
				mv.setViewName("common/message");
			}

		} catch (Exception e) {
			mv.addObject("msg", "전체 채팅방 리스트 조회 실패");
			mv.addObject("url", "/admin/main");
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	
	
	// 채팅방 강제삭제
	@GetMapping("/admin/deletechatroom")
	public ModelAndView deleteChatByAdmin (ModelAndView mv
											, @RequestParam(value="chatNo") Integer chatNo
											, HttpSession session) {
		//DELETE CHAT_ROOM_TBL WHERE CHAT_NO = ?
			
			try {
				String adminYn = (String)session.getAttribute("adminYn"); 
				
				if(adminYn != null && adminYn.equals("Y")) {  
					Integer result = adminService.deleteChatByAdmin(chatNo);
					if(result>0) {
						mv.addObject("msg", "채팅방 삭제 완료");
						mv.addObject("url", "/admin/chatlist");
						mv.setViewName("common/message");
						
					}else {
						
						mv.addObject("msg", "채팅방 삭제가 완료되지 않았습니다");
						mv.addObject("url", "/admin/chatlist");
						mv.setViewName("common/message");
					}
				}else {
					mv.addObject("msg", "관리자만 삭제할 수 있습니다");
					mv.addObject("url", "/");  //메인화면으로 돌아감
					mv.setViewName("common/message");
				}
			} catch (Exception e) {
				mv.addObject("msg", "채팅방 삭제 실패");
				mv.addObject("url", "/admin/chatlist");
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



