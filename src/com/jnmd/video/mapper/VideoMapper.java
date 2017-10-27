package com.jnmd.video.mapper;

import java.util.List;

import com.jnmd.video.pojo.BatchDeleteVo;
import com.jnmd.video.pojo.Video;
import com.jnmd.video.pojo.VideoQueryVo;

public interface VideoMapper {

	
	public List<Video> selectVideoAll();

	public Video selectVideoById(int id);

	public void updateVideo(Video video);

	public void saveVideo(Video video);

	public void deleteVideoById(int id);

	public List<Video> selectVideoByVo(VideoQueryVo video);

	public void batchDeleteByVo(BatchDeleteVo vo);

	public int getCountVideo(VideoQueryVo vo);

	public List<Video> findVideoByCourseId(Integer id);
}
