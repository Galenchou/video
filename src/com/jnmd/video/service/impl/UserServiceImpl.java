package com.jnmd.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jnmd.video.mapper.UserMapper;
import com.jnmd.video.pojo.User;
import com.jnmd.video.pojo.UserExample;
import com.jnmd.video.pojo.UserExample.Criteria;
import com.jnmd.video.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int getCountByEmail(String email) {
		
		UserExample example=new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		return userMapper.countByExample(example);  //select count(1) from user where email=xxx
		
	}

	@Override
	public int saveUser(User user) {
		// TODO Auto-generated method stub
		//mybatis 中的新增、修改、删除都可以返回一个数字，该数字的意思是：影响的行数
		return userMapper.insert(user);
	}

	@Override
	public int login(User user) {
		
		UserExample example=new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(user.getEmail());
		createCriteria.andPasswordEqualTo(user.getPassword());
		return userMapper.countByExample(example);
	}

	@Override
	public User getUserByAccount(String email) {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		return userMapper.selectByExample(example).get(0);
	}

	@Override
	public void updateImageUrl(String email, String newName) {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		
		User user =new User();
		user.setImgurl(newName);
		userMapper.updateByExampleSelective(user, example);
	}

	@Override
	public void saveCode(String email, String code) {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		
		User user =new User();
		user.setCode(code);
		userMapper.updateByExampleSelective(user, example);
	}

}
