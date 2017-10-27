package com.jnmd.video.utils;

import org.springframework.util.DigestUtils;

public class Md5Utils {

	
	public static String md5(String str){
		
		//一次加密
		String pass =DigestUtils.md5DigestAsHex(str.getBytes());
		
		String h6=pass.substring(pass.length()-6);
		pass=DigestUtils.md5DigestAsHex((h6+pass).getBytes());
		
		System.out.println(pass);
		
		return pass;
	}
}
