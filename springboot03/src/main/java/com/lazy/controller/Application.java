package com.lazy.controller;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

import com.lazy.util.MyMapper;

//启动springboot的配置
@EnableAutoConfiguration 
//扫描controller、service
@ComponentScan(basePackages={"com.lazy.controller","com.lazy.service.impl"})
//扫描mapper
@MapperScan(basePackages={"com.lazy.mapper"})
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		System.out.println("程序启动完成..................");
	}
}
