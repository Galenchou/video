package com.jnmd.video.service;

import java.util.List;

import com.jnmd.video.pojo.Speaker;

public interface SpeakerService {

	public List<Speaker> findSpeakerAll();

	public Speaker selectSpeakerById(Integer spearkerId);
}
