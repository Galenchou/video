package com.jnmd.video.mapper;

import java.util.List;

import com.jnmd.video.pojo.Course;

public interface CourseMapper {

	List<Course> findCourseAll();

	List<Course> findCourseBySubjectId(int subjectId);

	Course selectCourseById(Integer courseId);

}
