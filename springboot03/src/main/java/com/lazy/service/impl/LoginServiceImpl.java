package com.lazy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.lazy.bean.MenuNav;
import com.lazy.bean.Person;
import com.lazy.mapper.MenuNavMapper;
import com.lazy.mapper.PersonMapper;
import com.lazy.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private PersonMapper personMapper;
	@Autowired
	private MenuNavMapper menuNavMapper;
	
	/* (non-Javadoc)
	 * @see com.lazy.service.LoginService#login()
	 */
	@Override
	public List<Map<String, Object>> login(String account,String password){
		return personMapper.getAllPerson(account, password);
	}
	@Override
	public Person queryPerson(Person person) {
		Person personnew=personMapper.selectOne(person);
		return personnew;
	}
	@Override
	public List<Map<String, Object>> getNavsByid(Long id) {
		return menuNavMapper.getNavsByid(id);
	}
	@Override
	public Map<String, Object> getAllNavs(Integer page,Integer rows) {
		Integer startIndex = (page-1)*rows;
		List<Map<String, Object>> navs = menuNavMapper.getAllNavs(startIndex, rows);
		int count= menuNavMapper.countNavs();
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("total", count);
		hm.put("rows", navs);
		
		return hm;
	}
	@Override
	public List<Map<String, Object>> getNavsForCombox() {
		// TODO Auto-generated method stub
		
		List<MenuNav> list =  menuNavMapper.selectAll();
		System.out.println(list);
		return menuNavMapper.getNavsForCombox();
	}
	@Override
	public int saveNav( MenuNav menuNav){
		if(menuNav.getId()!=null &&menuNav.getId()>0){
			//有主键进行更新
			return menuNavMapper.updateByPrimaryKey(menuNav);
		}else{
			//没有主键进行保存
			return menuNavMapper.insertSelective(menuNav);
		}
	}
	@Override
	public int deleteNavs(List<String> menuNavs){
		int i=0;
		for(String mn:menuNavs){
			int num=menuNavMapper.deleteByPrimaryKey(Integer.valueOf(mn));
			i+=num;
		}
		return i;
	}
}
