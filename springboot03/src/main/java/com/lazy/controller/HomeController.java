package com.lazy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String toLogin(){
		System.out.println("欢迎来到登陆页面");
		return "/login.jsp";
	}
}
