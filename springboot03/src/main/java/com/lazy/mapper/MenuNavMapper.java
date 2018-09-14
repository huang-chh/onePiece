package com.lazy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.lazy.bean.MenuNav;
import com.lazy.util.MyMapper;

public interface MenuNavMapper extends MyMapper<MenuNav>{
	@Select(" select * from menuNav where pid=#{param1}")
	public List<Map<String,Object>> getNavsByid(Long id);
	
	@Select(" select * from menuNav limit #{param1},#{param2}")
	public List<Map<String,Object>> getAllNavs(Integer startIndex ,Integer rows);
	
	@Select(" select count(1) from menuNav ")
	public int countNavs();
	
	@Select(" select * from menuNav ")
	public List<Map<String, Object>> getNavsForCombox();

}
