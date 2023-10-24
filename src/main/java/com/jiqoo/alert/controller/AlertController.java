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
							  , @RequestParam(value="comtNo", required=false ) int comtNo ) throws Exception{
		Integer result = 1;
		result = alertService.insertAlarm(alert);
//		System.out.println(alert);
		return result;
	}
	
	//알람수
	@ResponseBody
	@GetMapping(value = "/alert/alarmcount")
	public Integer selectAlarmCount (@ModelAttribute Alert alert
									,HttpSession session) throws Exception{
		String toUserId = (String)session.getAttribute("userId");
		Integer result = alertService.selectAlarmCount(toUserId);
		alert.setToUserId(toUserId);
		
		return result;
	}
	
	//알람리스트
	@ResponseBody
	@GetMapping(value = "/alert/alarmlist" , produces="application/json;charset=utf-8")
	public String selectAlarmList(Alert alert , HttpSession session ) throws Exception{
		 List<Alert> alertList = alertService.selectAlarmList(alert);				

		 Gson gson = new Gson();
		return gson.toJson(alertList);
	}	
	
	
	//알람리스트 삭제 
	@ResponseBody
	@PostMapping(value = "/alert/deletealarm")
	public Integer deleteAlarm(String fromUserId
							 , int boardNo
							 , HttpSession session) throws Exception{
		System.out.println("알람클릭");
//		String toUserId = (String)session.getAttribute("userId");
		
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("alert", alert);
//		paramMap.put("boardNo", boardNo);
		Alert alert = new Alert(fromUserId, boardNo);
		Integer result = alertService.deleteAlarm(alert);
		
		return result;
	}
		
	//알람 정보 가져오기 
	//알람리스트
	@ResponseBody
	@GetMapping(value = "/alert/saerchAlarm" , produces="application/json;charset=utf-8")
	public String searchAlarmList(Alert alert , HttpSession session ) throws Exception{
		 List<Alert> alertList = alertService.selectAlarmList(alert);		
		

		 Gson gson = new Gson();
		return gson.toJson(alertList);
	}
	
		


}
