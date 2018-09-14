package com.lazy.service;

import java.util.List;
import java.util.Map;

import com.lazy.bean.MenuNav;
import com.lazy.bean.Person;

public interface LoginService {

	public List<Map<String, Object>> login(String account,String password);
	
	public Person queryPerson(Person person);

	List<Map<String, Object>> getNavsByid(Long id);

	Map<String, Object> getAllNavs(Integer page,Integer rows);
	
	List<Map<String, Object>> getNavsForCombox();

	int saveNav( MenuNav menuNav);

	int deleteNavs(List<String> menuNavs);
}