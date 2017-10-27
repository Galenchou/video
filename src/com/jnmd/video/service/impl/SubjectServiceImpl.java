package com.jnmd.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnmd.video.mapper.SubjectMapper;
import com.jnmd.video.pojo.Subject;
import com.jnmd.video.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;
	
	@Override
	public Subject selectSubjectById(int subjectId) {
		// TODO Auto-generated method stub
		return subjectMapper.selectByPrimaryKey(subjectId);
	}

}
