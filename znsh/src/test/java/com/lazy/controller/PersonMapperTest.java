package com.lazy.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lazy.entity.Person;
import com.lazy.mapper.PersonMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class PersonMapperTest {
	@Autowired
	private PersonMapper personMapper;
	@Test
	public void testFindAll() {
		List<Person> persons = personMapper.findAll();
		System.out.println(persons.get(0).toString());
	}

}
