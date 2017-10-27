package com.jnmd.video.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jnmd.video.pojo.Course;
import com.jnmd.video.pojo.Speaker;
import com.jnmd.video.pojo.Video;
import com.jnmd.video.pojo.VideoQueryVo;
import com.jnmd.video.service.CourseService;
import com.jnmd.video.service.SpeakerService;
import com.jnmd.video.service.VideoService;
import com.jnmd.video.utils.Page;
import com.jnmd.video.utils.TimeUtils;

@Controller
@RequestMapping("/video")
public class VideoController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private SpeakerService speakerService;
	
	@Autowired
	private CourseService courseService;
	
	
	@RequestMapping("/showVideo")
	public ModelAndView showVideoList(VideoQueryVo queryVo){
		
		System.out.println("进入showVideoList方法:"+queryVo);
		
		ModelAndView modelAndView =new ModelAndView();
		
		
		queryVo.setBegin((queryVo.getPage()-1)*queryVo.getRows()); //设置每次分页查询的开始位置
		List<Video> list =videoService.findVideoByVo(queryVo);
		
		
		for (Video video2 : list) {
			if(null!=video2.getTime() && video2.getTime()!=0){
				video2.setShowTime(TimeUtils.getHMS(video2.getTime()));
			}
			
			
		}
		//modelAndView.addObject("list",list);
		modelAndView.addObject("speakerList", speakerService.findSpeakerAll());
		modelAndView.addObject("courseList", courseService.findCourseAll());
		
		Page<Video> page =new Page<Video>();
		page.setPage(queryVo.getPage());
		page.setSize(queryVo.getRows());
		page.setTotal(videoService.getCountVideo(queryVo));
		page.setRows(list);
		modelAndView.addObject("page",page);
		
		
		modelAndView.setViewName("admin/video/index");
		return modelAndView;
	}
	
	@RequestMapping("playVideo")
	public String playVideo(int videoId,String subjectName,Model model){
		
		//看界面，写代码
		
		//通过videoId 查询Video详情
		Video video =videoService.findVideoById(videoId);
		
		
		
		System.out.println("姓名："+video.getSpeakerName());
		
		//查询主讲人信息
		Speaker speaker = speakerService.selectSpeakerById(video.getSpearkerId());
		//课程信息
		Course course =courseService.selectCourseById(video.getCourseId());
		
		//根据课程id查询所有相关课程，并循环展示
		List<Video> list = videoService.findVideoByCourseId(video.getCourseId());
		for (Video video2 : list) {
			
			if(null!=video2.getTime() && video2.getTime()!=0){
				video2.setShowTime(TimeUtils.getHMS(video2.getTime()));
			}else{
				video2.setShowTime("00:00:00");
			}
		}
		
		model.addAttribute("speaker", speaker);
		model.addAttribute("video", video);
		model.addAttribute("course", course);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("videoList",list);
		return "before/front/video/index";
	}
	
	//http://localhost:8080/Day07_video/video/editVideo?sid=1
	//http://localhost:8080/Day07_video/video/editVideo/256
	@RequestMapping("/editVideo/{id}")
	//@RequestParam() 是解决请求的参数名称和方法的参数名称不一致问题
	//和   @PathVariable()  解决restful风格从路径中取值
	public String editVideo(@PathVariable() int id,Model model){
		
		//修改
		if(id!=-1){
			
			Video video = videoService.findVideoById(id);
			
			model.addAttribute("video", video);
			
		}
		//新增
		
		model.addAttribute("speakerList", speakerService.findSpeakerAll());
		model.addAttribute("courseList", courseService.findCourseAll());
		
		return "admin/video/edit";
		
	}
	
	@RequestMapping("batchDelete.action")
	public String batchDelete(Integer[] ids){
		
		
		//批量删除
		videoService.batchDeleteByIds(ids);
		
		return "redirect:showVideo.action";
	}
	
	@RequestMapping("saveOrUpdateVideo.action")
	public String saveOrUpdateVideo(Video video){
		
		//修改
		if(video.getId()!=null && video.getId()!=0){
			videoService.updateVideo(video);
		//新增
		}else{
			video.setPlayNum(0);
			videoService.saveVideo(video);
		}
		
		return "redirect:showVideo.action";
	}
	
	@RequestMapping("deleteVideo.action")
	@ResponseBody //处理结果，不走视图解析器，而且会将数据转换成为json,但是如果是String，不用转
	public String deleteVideo(int id){
		
		videoService.deleteVideoById(id);
		return "success";
	}
	
	
	

}
