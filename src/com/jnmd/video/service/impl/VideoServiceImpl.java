package com.jnmd.video.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnmd.video.mapper.VideoMapper;
import com.jnmd.video.pojo.BatchDeleteVo;
import com.jnmd.video.pojo.Video;
import com.jnmd.video.pojo.VideoQueryVo;
import com.jnmd.video.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private VideoMapper videoMapper;

	@Override
	public List<Video> findVideoAll() {
		//查询数据库
		return videoMapper.selectVideoAll();
	}

	@Override
	public Video findVideoById(int id) {
		// TODO Auto-generated method stub
		return videoMapper.selectVideoById(id);
	}

	@Override
	public void updateVideo(Video video) {
		// TODO Auto-generated method stub
		videoMapper.updateVideo(video);
	}

	@Override
	public void saveVideo(Video video) {
		// TODO Auto-generated method stub
		videoMapper.saveVideo(video);
	}

	@Override
	public void deleteVideoById(int id) {
		// TODO Auto-generated method stub
		videoMapper.deleteVideoById(id);
	}

	@Override
	public List<Video> findVideoByVo(VideoQueryVo video) {
		
		
		return videoMapper.selectVideoByVo(video);
	}

	@Override
	public void batchDeleteByIds(Integer[] ids) {
		
		BatchDeleteVo vo =new BatchDeleteVo();
		//该List只能读取，不能修改
		List<Integer> asList = Arrays.asList(ids);
		vo.setIds(asList);
		videoMapper.batchDeleteByVo(vo);
		
	}

	@Override
	public int getCountVideo(VideoQueryVo vo) {
		// TODO Auto-generated method stub
		return videoMapper.getCountVideo(vo);
	}

	@Override
	public List<Video> findVideoByCourseId(Integer id) {
		// TODO Auto-generated method stub
		return videoMapper.findVideoByCourseId(id);
	}

}
