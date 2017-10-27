package com.jnmd.video.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnmd.video.service.AdminService;
import com.jnmd.video.utils.Md5Utils;

@Controller
@RequestMapping("admin")
public class LoginController {
	
	@Autowired
	private AdminService adminService;

	//RequestMethod.POST 限定只有post请求才响应
	@RequestMapping(value={"showLogin","aaa.action","bbb.action"},method=RequestMethod.GET)
	public String showLogin(){
		/*try{*/
		//int i=10/0;
		/*}catch(Exception e){
			throw  new RuntimeException("哈哈");
		}*/
		return "admin/login";
	}
	
	@RequestMapping("adminLogin")
	public String login(String username,String password,HttpSession sessison){
		
		System.out.println("login");
		 //需要先将password MD5加密
		String mw=Md5Utils.md5(password);
		
		int result =adminService.login(username, mw);
		
		if(result>0){
			sessison.setAttribute("username", username);
			//跳转到时候记得前面加/
			return "redirect:/video/showVideo.action";
		}
		
		return "redirect:/admin/showLogin.action";
		
		//return result>0 ?"redirect:showVideo.action":"redirect:showLogin.action";
		
		
	}
	
	@RequestMapping("loginOut")  
	public String exit(HttpSession session){
		session.removeAttribute("username");
		return "redirect:/admin/showLogin.action";
	}
	
	
}
