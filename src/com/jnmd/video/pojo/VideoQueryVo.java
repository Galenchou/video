package com.jnmd.video.pojo;

public class VideoQueryVo {
	
	//前三个用于传递查询条件
	private String title;
	private int spearkerId;
	private int courseId;
	
	private int page=1;  //当前页
	private int rows=5; //每页多少条
	private int begin=0; //分页查询时开始的位置
	
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSpearkerId() {
		return spearkerId;
	}
	public void setSpearkerId(int spearkerId) {
		this.spearkerId = spearkerId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "VideoQueryVo [title=" + title + ", spearkerId=" + spearkerId
				+ ", courseId=" + courseId + ", page=" + page + ", rows="
				+ rows + "]";
	}
	
	

}
