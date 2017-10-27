package com.jnmd.video.exception;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomHandlerException implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception e) {
		// TODO Auto-generated method stub
		ModelAndView model =new ModelAndView();
		
		Writer out =new StringWriter();
		PrintWriter s=new PrintWriter(out);
		e.printStackTrace(s);
		
		String msg =out.toString();
		
		model.setViewName("error");
		model.addObject("message", msg);
		
		return model;
	}

}
