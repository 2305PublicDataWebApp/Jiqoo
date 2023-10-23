package com.jiqoo.report.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.report.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	//모꾸신고_신고사유 리셋
	@GetMapping("/admin/resetmoqooreport")
	public ModelAndView resetReportMByAdmin (ModelAndView mv
								  		, @RequestParam("userId") String userId
								  		, @RequestParam("moqooNo") String moqooNo) {
		// REPORT_TBL SET REPORT_CONTENT = null WHERE REPORT_USER_ID = ? AND REPORT_POST_NO = ? AND REPORT_TYPE = 'M' 
		//DELETE REPORT_TBL WHERE REPORT_USER_ID = ? AND REPORT_POST_NO = ? 
		try {
			Map<String, String>resetReportMap = new HashMap<>();
			resetReportMap.put("userId", userId);
			resetReportMap.put("moqooNo", moqooNo);
			
			Integer result = reportService.resetReportMByAdmin(resetReportMap);
			if(result>0) {
				mv.addObject("msg", "신고 리셋 완료");
				mv.addObject("url", "/admin/userdetail?userId=" + userId);
				mv.setViewName("common/message");
				//탈퇴시킬때 회원 강제 로그아웃 시키려면?
				
			}else {
				mv.addObject("msg", "신고 리셋을 완료하지 못했습니다.");
				mv.addObject("url", "/admin/userdetail?userId=" + userId);
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "신고 리셋 실패");
			mv.addObject("url", "/admin/userdetail?userId=" + userId);
			mv.setViewName("common/message");
		}
		return mv;
	}
	
	//회원신고_신고사유 리셋
	@GetMapping("/admin/resetuserreport")
	public ModelAndView resetReportUByAdmin (ModelAndView mv
								  		, @RequestParam("userId") String userId
								  		, @RequestParam("moqooNo") String moqooNo) {
		// REPORT_TBL SET REPORT_CONTENT = null WHERE REPORT_USER_ID = ? AND REPORT_POST_NO = ? AND REPORT_TYPE = 'M' 
		//DELETE REPORT_TBL WHERE REPORT_USER_ID = ? AND REPORT_POST_NO = ? 
		try {
			Map<String, String>resetReportMap = new HashMap<>();
			resetReportMap.put("userId", userId);
			resetReportMap.put("moqooNo", moqooNo);
			
			Integer result = reportService.resetReportMByAdmin(resetReportMap);
			if(result>0) {
				mv.addObject("msg", "신고 리셋 완료");
				mv.addObject("url", "/admin/userdetail?userId=" + userId);
				mv.setViewName("common/message");
				//탈퇴시킬때 회원 강제 로그아웃 시키려면?
				
			}else {
				mv.addObject("msg", "신고 리셋을 완료하지 못했습니다.");
				mv.addObject("url", "/admin/userdetail?userId=" + userId);
				mv.setViewName("common/message");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "신고 리셋 실패");
			mv.addObject("url", "/admin/userdetail?userId=" + userId);
			mv.setViewName("common/message");
		}
		return mv;
	}

}
