package com.lazy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.lazy.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping(value="/hello")
	public String login(){
		System.out.println("springmvc is success");
		return "login";
	}
	@RequestMapping(value="/helloParams/{id}")
	public String helloParams(@PathVariable(value="id") int id ){
		System.out.println("ǰ̨���������ǣ�"+id);
		return "downLoadInfo";
	}
	@RequestMapping(value="/login")
	@ResponseBody
	public User login(HttpServletRequest request){
		System.out.println(request.getParameter("name"));	
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setId(Integer.parseInt(request.getParameter("password")));
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("menu");
		return user; 
	}
}
