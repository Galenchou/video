package com.jnmd.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnmd.video.mapper.SpeakerMapper;
import com.jnmd.video.mapper.VideoMapper;
import com.jnmd.video.pojo.Speaker;
import com.jnmd.video.pojo.Video;
import com.jnmd.video.service.SpeakerService;
import com.jnmd.video.service.VideoService;

@Service
public class SpeakerServiceImpl implements SpeakerService {
	
	@Autowired
	private SpeakerMapper speakerMapper;

	

	@Override
	public List<Speaker> findSpeakerAll() {
		// TODO Auto-generated method stub
		return speakerMapper.selectAllSpeaker();
	}



	@Override
	public Speaker selectSpeakerById(Integer spearkerId) {
		// TODO Auto-generated method stub
		return speakerMapper.selectSpeakerById(spearkerId);
	}

}
