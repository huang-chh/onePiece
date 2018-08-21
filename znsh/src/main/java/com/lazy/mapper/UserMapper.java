package com.lazy.mapper;

import java.util.List;

import com.lazy.entity.User;

import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User>{
	public List<User> findAll();
}
