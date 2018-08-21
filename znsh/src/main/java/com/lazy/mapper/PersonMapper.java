package com.lazy.mapper;

import java.util.List;

import com.lazy.entity.Person;

import tk.mybatis.mapper.common.Mapper;

public interface PersonMapper extends Mapper<Person>{
	public List<Person> findAll();
	
	public List<Person> queryPersonInfo(Person person);
	
	public int selectCount(Person person);
}
