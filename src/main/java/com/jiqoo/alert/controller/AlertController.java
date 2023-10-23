package com.jiqoo.alert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jiqoo.alert.domain.Alert;
import com.jiqoo.alert.service.AlertService;

@Controller
public class AlertController {
	@Autowired
	private AlertService alertService;
	
	@Autowired
	private AlertHandler alertHandler;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	//알람등록 
	@ResponseBody
	@PostMapping(value = "/alert/insertalarm", produces="application/json;charset=utf-8")
	public Integer insertAlram (@ModelAttribute Alert alert
							  , @RequestParam(value="replyNo", required=false ) int replyNo ) throws Exception{
		Integer result = 1;
		result = alertService.insertAlarm(alert);
//		System.out.println(alert);
		return result;
	}
	
	//알람수
	@ResponseBody
	@GetMapping(value = "/alert/alarmcount.kh")
	public Integer selectAlarmCount (@ModelAttribute Alert alert
									,HttpSession session) throws Exception{
		String memberId = (String)session.getAttribute("memberId");
		Integer result = alertService.selectAlarmCount(memberId);
		alert.setToUserId(memberId);
		
			return result;
	}
	
	//알람목록
	@ResponseBody
	@GetMapping(value = "/alert/alarmlist.kh" , produces="application/json;charset=utf-8")
	public String selectAlarmList(String memberId) throws Exception{
		 List<Alert> alertList = alertService.selectAlarmList(memberId);				

		 Gson gson = new Gson();
		return gson.toJson(alertList);
	}	
	
	
	//알람리스트 삭제 
	@ResponseBody
	@PostMapping(value = "/alert/deletealarm.kh")
	public Integer deleteAlarm(@ModelAttribute Alert alert, String memberId, Integer boardNo, HttpSession session) throws Exception{
		System.out.println("알람클릭");
		String toUserId = (String)session.getAttribute("memberId");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("toUserId", toUserId);
		paramMap.put("boardNo", boardNo);
		Integer result = alertService.deleteAlarm(paramMap);
		
		return result;
	}
//	https://kimfk567.tistory.com/75
		
		
		


}
