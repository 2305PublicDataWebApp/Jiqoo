package com.jiqoo.alert.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class AlertController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@MessageMapping("/sendMessage")
	@SendTo("/topic/receiveMessage")
	public String sendMessage(String message) {
	        return message;
	}
	 

	
	

		
		
		


}
