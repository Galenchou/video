package com.jnmd.video.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jnmd.video.pojo.Course;
import com.jnmd.video.pojo.Subject;
import com.jnmd.video.pojo.Video;
import com.jnmd.video.service.CourseService;
import com.jnmd.video.service.SubjectService;
import com.jnmd.video.service.VideoService;

@Controller
@RequestMapping("/front/course")
public class CourseController {
	
	//学科  课程  视频
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private VideoService videoService;

	@RequestMapping("/index")
	public String showCourseById(int subjectId,Model model){
		
		//示意代码
		//第一步查询学科信息
		Subject subject = subjectService.selectSubjectById(subjectId);
		
		//2、通过学科查询课程信息
		List<Course> listCourse = courseService.findCourseBySubjectId(subjectId);
		subject.setCourseList(listCourse);
		for (Course course : listCourse) {
			//3、通过课程id查询视频信息
			List<Video> listVideo=videoService.findVideoByCourseId(course.getId());
			course.setListVideo(listVideo);
		}
		model.addAttribute("subject", subject);
		
		return "before/front/course/index";
	}
}
