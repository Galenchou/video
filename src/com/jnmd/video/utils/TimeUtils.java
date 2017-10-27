package com.jnmd.video.utils;

public class TimeUtils {
	
	
	public static String getHMS(int second){
		//获取小时
		int hour=second/3600;
		//获取分钟
		int minute=second%3600/60;
		//获取秒值
		int _second=second%60;
		
		return formatTime(hour)+":"+formatTime(minute)+":"+formatTime(_second);
	}
	
	public static String formatTime(int time){
		if(time<10){
			return "0"+time;
		}else{
			return ""+time;
		}
	}

}
