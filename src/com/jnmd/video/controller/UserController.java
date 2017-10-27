package com.jnmd.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jnmd.video.pojo.User;
import com.jnmd.video.service.UserService;
import com.jnmd.video.utils.ImageCut;
import com.jnmd.video.utils.JavaEmailSender;
import com.jnmd.video.utils.Md5Utils;
import com.jnmd.video.utils.RandomCode;

@Controller
public class UserController {
	
	//servlet 不建议在类中定义全局变量
	//private int i =10;
	//从配置文件中获取一个值，赋值给IMG_LOCATION字段
	@Value("${IMG_LOCATION}")
	private String IMG_LOCATION;
	
	@Autowired
	private UserService userService;

	@RequestMapping("user/validateEmail")
	@ResponseBody
	public String validateEmail(String email){
		
		int count =userService.getCountByEmail(email);
		
		return count>0?"fail":"success";
	}
	
	@RequestMapping("user/insertUser")
	@ResponseBody
	public String register(User user,HttpSession session){
		user.setPassword(Md5Utils.md5(user.getPassword()));
		
		int result =userService.saveUser(user);
		if(result>0){
			
			session.setAttribute("_userAccount", user.getEmail());
			
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	@RequestMapping("user/loginUser")
	@ResponseBody
	public String loginUser(User user,HttpSession session){
		
		user.setPassword(Md5Utils.md5(user.getPassword()));
		
		int result =userService.login(user);
		if(result>0){
			
			session.setAttribute("_userAccount", user.getEmail());
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	@RequestMapping("user/logout")
	public String loginOut(HttpSession session){
		session.removeAttribute("_userAccount");
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping("user/index")
	public String showUser(Model model,HttpSession session){
		
		String email =(String) session.getAttribute("_userAccount");
		User user =userService.getUserByAccount(email);
		
		model.addAttribute("user", user);
		
		return "before/front/user/index";
	}
	
	//修改个人资料
	
	@RequestMapping("user/profile")
	public String editUser(HttpSession session,Model model){
		
		System.out.println("session:"+session.getAttribute("_userAccount"));
		String email =(String) session.getAttribute("_userAccount");
		User user =userService.getUserByAccount(email);
		
		model.addAttribute("user", user);
		
		return "before/front/user/profile";
	}
	
	@RequestMapping("user/avatar")
	public String changeUserImg(HttpSession session,Model model){
		
		String email =(String) session.getAttribute("_userAccount");
		User user =userService.getUserByAccount(email);
		
		model.addAttribute("user", user);
		
		return "before/front/user/avatar";
	}
	
	@RequestMapping("user/password")
	public String changeUserPwd(HttpSession session,Model model){
		String email =(String) session.getAttribute("_userAccount");
		User user =userService.getUserByAccount(email);
		
		model.addAttribute("user", user);
		
		return "before/front/user/password";
	}
	
	@RequestMapping("user/upLoadImage")
	public String uploadImg(MultipartFile image_file ,HttpServletRequest request ,HttpSession session,Model model){
		
		
		//获取坐标信息
		System.out.println("x1"+request.getParameter("x1"));
		System.out.println("y1"+request.getParameter("y1"));
		System.out.println("x2"+request.getParameter("x2"));
		System.out.println("y2"+request.getParameter("y2"));
		float x1=0,x2=0,y1=0,y2=0;
		boolean isCut =false;
		//切图的逻辑是：将图片上传到服务器以后，切服务器上的原图，然后覆盖
		if(null!=request.getParameter("x1")&& !"".equals(request.getParameter("x1"))){
			x1=Float.parseFloat(request.getParameter("x1"));
			y1=Float.parseFloat(request.getParameter("y1"));
			x2=Float.parseFloat(request.getParameter("x2"));
			y2=Float.parseFloat(request.getParameter("y2"));
			isCut =true;
		}
		
		
		//图片名字
		String oldName=image_file.getOriginalFilename();
		System.out.println(oldName);
		//生成一个新的名字，不能重复
		String picName=UUID.randomUUID().toString();
		//获取之前的后缀
		String extName= oldName.substring(oldName.lastIndexOf("."));
		
		String newName=picName+extName;
		//想上传，一句话搞定
		try {
			System.out.println(IMG_LOCATION+newName);
			image_file.transferTo(new File(IMG_LOCATION+newName));
			
			//切图片
			if(isCut){
				ImageCut imageCut =new ImageCut();
				imageCut.cutImage(IMG_LOCATION+newName, (int)x1,(int)y1, (int)(x2-x1), (int)(y2-y1));
			}
			
			//通过账户修改头像
			String email =(String) session.getAttribute("_userAccount");
			userService.updateImageUrl(email,newName);
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/user/avatar";
		/*String email =(String) session.getAttribute("_userAccount");
		User user =userService.getUserByAccount(email);
		
		model.addAttribute("user", user);
		
		return "before/front/user/password";*/
		
	}
	
	@RequestMapping("user/forgetPassword")
	public String forgetPassword(){
		return "before/front/user/forget_pwd";
	}
	
	
	@RequestMapping("user/sendEmail")
	@ResponseBody
	public String sendEmail(String email,HttpSession session){
		
		//获取随机数 6位
		String code =RandomCode.getRandomCode(6);
		//发送邮件
		try {
			JavaEmailSender.sendEmail(email, "隔壁老王学习网验证码", "您本次的验证码是："+code+",该验证码的有效时间为24小时");
			//将随机数保存到数据库中
			userService.saveCode(email,code);
			session.setAttribute("email", email);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	
	
}
