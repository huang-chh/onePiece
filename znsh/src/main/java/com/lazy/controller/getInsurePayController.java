package com.lazy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/downLoad")
public class getInsurePayController {
	
	@RequestMapping(value="/getInsurePay")
	public String getInsurePay(){
		System.out.println("------------------------------333333333333");
		return "getInsurePay";
	}
}
