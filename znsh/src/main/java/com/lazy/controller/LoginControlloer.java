package com.lazy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lazy.entity.Person;
import com.lazy.service.LoginService;

@Controller
@RequestMapping(value="/login")
public class LoginControlloer {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(Person person){
		Map<String, Object> map =  new HashMap<String, Object>();
		List<Person> persons =loginService.queryPerson(person);
		if(persons.size()==1){
			map.put("isLogin", "YES");
			return map;
		}else{
			map.put("isLogin", "NO");
			return map;
		}
	}
	@RequestMapping("/register")
	@ResponseBody
	public Map<String, Object> register(Person person){
		Map<String, Object> map =  new HashMap<String, Object>();
//		List<Person> persons =loginService.queryPerson(person);
//		if(persons.size()==1){
//			map.put("isLogin", "YES");
//			return map;
//		}else{
//			map.put("isLogin", "NO");
//			return map;
//		}
		System.out.println(person.getAccount());
		return map;
	}
}
