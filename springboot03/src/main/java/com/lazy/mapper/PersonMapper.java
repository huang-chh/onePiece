package com.lazy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import tk.mybatis.mapper.common.Mapper;

import com.lazy.bean.Person;

public interface PersonMapper extends Mapper<Person> {
	@Select("select * from person where account=#{param1} and password =#{param2}")
	public List<Map<String,Object>> getAllPerson(String account,String password);
	
	
}
