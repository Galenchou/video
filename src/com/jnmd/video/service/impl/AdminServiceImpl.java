package com.jnmd.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnmd.video.mapper.AdminMapper;
import com.jnmd.video.pojo.Admin;
import com.jnmd.video.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public int login(String username, String password) {
		// TODO Auto-generated method stub
		Admin admin =new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		return adminMapper.login(admin);
	}

}
