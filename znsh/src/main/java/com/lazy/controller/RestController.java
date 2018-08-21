package com.lazy.controller;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/rest")
public class RestController {
	@RequestMapping("/testGet/{id}")
	public ModelAndView testGet(@PathVariable(value="id") int id){
		System.out.println("testGet id is "+id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", "get");
		mv.setViewName("success");
		return mv;
	}
	@RequestMapping("/testPost")
	public ModelAndView testPost(Integer id){
		System.out.println("testPost id is "+id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", "post");
		mv.setViewName("downLoadInfo");
		return mv;
	}
	@RequestMapping("/testDelete")
	public String testdelete(Map<String,Object> map){
		System.out.println(map.get("id"));
		map.put("name", "delete");
		return "success";
	}
	@RequestMapping("/testPut")
	public String testput(Map<String,Object> map){
		System.out.println(map.get("id"));
		map.put("name", "put");
		return "success";
	}
	
}
