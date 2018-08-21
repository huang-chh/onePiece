package com.lazy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lazy.entity.Person;
import com.lazy.mapper.PersonMapper;
import com.lazy.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private PersonMapper personMapper;
	@Override
	public List<Person> queryPerson(Person person) {
		List<Person> liPersons =personMapper.queryPersonInfo(person);
		return liPersons;
	}
	
}
