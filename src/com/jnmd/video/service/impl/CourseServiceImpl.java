package com.jnmd.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnmd.video.mapper.CourseMapper;
import com.jnmd.video.pojo.Course;
import com.jnmd.video.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseMapper courseMapper;

	@Override
	public List<Course> findCourseAll() {
		// TODO Auto-generated method stub
		return courseMapper.findCourseAll();
	}

	

	@Override
	public List<Course> findCourseBySubjectId(int subjectId) {
		// TODO Auto-generated method stub
		return courseMapper.findCourseBySubjectId(subjectId);
	}



	@Override
	public Course selectCourseById(Integer courseId) {
		// TODO Auto-generated method stub
		return courseMapper.selectCourseById(courseId);
	}

}
