package com.jnmd.video.pojo;

import java.util.List;

public class Course {
    private Integer id;

    private String courseTitle;

    private Integer subjectId;

    private String courseDesc;
    
    private List<Video> listVideo;

    public List<Video> getListVideo() {
		return listVideo;
	}

	public void setListVideo(List<Video> listVideo) {
		this.listVideo = listVideo;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle == null ? null : courseTitle.trim();
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getCourseDesc() {
        return courseDesc;
    }

    public void setCourseDesc(String courseDesc) {
        this.courseDesc = courseDesc == null ? null : courseDesc.trim();
    }
}