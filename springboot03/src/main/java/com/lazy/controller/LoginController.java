package com.lazy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lazy.bean.MenuNav;
import com.lazy.bean.Person;
import com.lazy.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(String account,String password){
		Map<String, Object> map =  new HashMap<String, Object>();
		List<Map<String, Object>> personList=loginService.login(account,password);
		if(personList.size()==1){
			map.put("isLogin", "YES");
			return map;
		}else{
			map.put("isLogin", "NO");
			return map;
		}
	}
	
	@RequestMapping("/getNavs")
	@ResponseBody
	public List<Map<String, Object>> getNavs(@RequestParam(defaultValue="0") Long id){
		return loginService.getNavsByid(id);
	}
	@RequestMapping("/getAllNavs")
	@ResponseBody
	public Map<String, Object> getAllNavs(int page,int rows){
		return loginService.getAllNavs(page,rows);
	}
	@RequestMapping("/getNavsForCombox")
	@ResponseBody
	public List<Map<String, Object>> getNavsForCombox(){
		return loginService.getNavsForCombox();
	}
	@RequestMapping("/saveNavs")
	@ResponseBody
	public int saveNavs( MenuNav menuNav){
		System.out.println(menuNav);
		return loginService.saveNav(menuNav);
	}
	
	@RequestMapping("/deleteNavs")
	@ResponseBody
	public int deleteNavs(HttpServletRequest httpServletRequest){
		String ids =httpServletRequest.getParameter("ids");
		return loginService.deleteNavs(Arrays.asList(ids.split(",")));
	}
	
	@RequestMapping("/hello.do")
	public String hello(){
		System.out.println("登录成功");
		return "/login.jsp";
	}
}
