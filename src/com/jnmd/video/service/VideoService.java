package com.jnmd.video.service;

import java.util.List;

import com.jnmd.video.pojo.Video;
import com.jnmd.video.pojo.VideoQueryVo;

public interface VideoService {

	public List<Video> findVideoAll();

	public Video findVideoById(int id);

	public void updateVideo(Video video);

	public void saveVideo(Video video);

	public void deleteVideoById(int id);

	public List<Video> findVideoByVo(VideoQueryVo queryVo);

	public void batchDeleteByIds(Integer[] ids);

	public int getCountVideo(VideoQueryVo queryVo);

	public List<Video> findVideoByCourseId(Integer id);
}
