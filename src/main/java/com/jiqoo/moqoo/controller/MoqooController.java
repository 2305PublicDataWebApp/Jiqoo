package com.jiqoo.moqoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MoqooController {
	
	@GetMapping("/moqoo/moqoo")
	public String showMoqooList() {
		return "moqoo/moqoo";
	}
}
