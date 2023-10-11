package com.jiqoo.jiqoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.common.domain.Category;
import com.jiqoo.jiqoo.domain.Jiqoo;
import com.jiqoo.jiqoo.service.JiqooService;

@Controller
public class JiqooController {

	@Autowired
	private JiqooService jiqooService;

	@GetMapping("/jiqoo/list.do")
	public ModelAndView showInsertJiqooForm(ModelAndView mv) {
		try {
			List<Category> categoryList = jiqooService.selectCategoryList();
			if (categoryList != null) {
				mv.addObject("categoryList", categoryList);
				mv.setViewName("jiqoo/jiqoo");
			} else {
				mv.addObject("msg", "게시물 리스트 조회 실패");
				mv.addObject("url", "/");
				mv.setViewName("common/result");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("url", "/");
			mv.setViewName("common/result");
		}
		return mv;
	}

	@PostMapping("/jiqoo/insert.do")
	public ModelAndView insertJiqoo(ModelAndView mv, @ModelAttribute Jiqoo jiqoo) {
		try {
			int result = jiqooService.insertJiqoo(jiqoo);
			if (result > 0) {
				mv.setViewName("redirect:/jiqoo/jiqoo.do");
			} else {
				mv.addObject("msg", "게시물 등록 실패");
				mv.addObject("url", "/jiqoo/list.do");
				mv.setViewName("common/result");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url", "/jiqoo/list.do");
			mv.setViewName("common/result");
		}
		return mv;
	}
}
