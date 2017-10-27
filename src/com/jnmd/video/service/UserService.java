package com.jnmd.video.service;

import com.jnmd.video.pojo.User;

public interface UserService {

	int getCountByEmail(String email);

	int saveUser(User user);

	int login(User user);

	User getUserByAccount(String email);

	void updateImageUrl(String email, String newName);

	void saveCode(String email, String code);

}
