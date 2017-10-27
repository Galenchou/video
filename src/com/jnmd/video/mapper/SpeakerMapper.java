package com.jnmd.video.mapper;

import java.util.List;

import com.jnmd.video.pojo.Speaker;

public interface SpeakerMapper {

	
	public List<Speaker> selectAllSpeaker();

	public Speaker selectSpeakerById(Integer spearkerId);
}
