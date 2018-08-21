package com.lazy.service;

import java.util.List;

import com.lazy.entity.Person;

public interface LoginService {
	public List<Person> queryPerson(Person person);
}
