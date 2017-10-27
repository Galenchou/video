package com.jnmd.video.utils;

public class RandomCode {

	public static String getRandomCode(int length){
		
		//Math.random()*10;  //[0,1)
		//Math.random().toString(36);
		String[] arr={"a","b","c","d","e","f","g","h","z","w"};
		String code="";
		for(int i=0;i<length-1;i++){
			int random =(int) (Math.random()*10);//0-9
			code+=arr[random];
		}
		
		return code;
		
		
	}
}
