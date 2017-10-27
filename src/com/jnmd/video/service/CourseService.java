package com.jnmd.video.service;

import java.util.List;

import com.jnmd.video.pojo.Course;
import com.jnmd.video.pojo.Speaker;

public interface CourseService {

	public List<Course> findCourseAll();

	//public void selectCourseById(int subjectId);

	public List<Course> findCourseBySubjectId(int subjectId);

	public Course selectCourseById(Integer courseId);
}
