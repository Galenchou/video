<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <base href="${BaseContext}">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="一根筋教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,一根筋教育,学习成就梦想！">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="icon" href="favicon.png" type="image/png" />
    <link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet" type="text/css">
    <title>在线公开课-一根筋教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body class="w100">
<jsp:include page="../include/header.jsp"></jsp:include>

    <%--<div id="detail"></div>--%>

<div>
    <!--面包屑导航-->
    <div class="container mian-nav">公开课 / ${subjectName}</div>
    <input type="hidden" id="videoId" value="${videoId}">
    <div id="content">
         <div class="intro">
	<div class="container">
				<div class="v-intro">
					<div class="left">
						<video id="videoPlayer" src="${video.videoUrl}" class="video-js vjs-default-skin" controls width="627" height="280"
							   poster="${video.imageUrl}" data-setup="{}">
						</video>
					</div>
		
					<div class="right">
						<p class="right-title">${video.title}</p>
						<div class="avatar">
							<span style="background-image: url(${speaker.headImgUrl})"></span>
							<p><b>讲师：${speaker.speakerName}</b><br><i>${speaker.speakerDesc}</i></p>
						</div>
						<p class="video-intro">
							<span>本节内容：</span> ${video.detail}
						</p>
					</div>
				</div>
		
				<div class="kcjs">
					<p class="title">课程介绍</p>
					<p class="content">${course.courseDesc}</p>
				</div>
		
			</div>
		</div>
		<!--目录-->
		<div class="catalog">
			<div class="container">
				<p class="title">目录</p>
		
				<c:forEach items="${videoList}" var="video" >
					<div class="chapter">
						<p class="biaoti"><a href="${pageContext.request.contextPath}/video/playVideo.action?videoId=${video.id}&subjectName=${subjectName}">${video.title}</a></p>
						<p class="lecturer">${video.detail}</p>
						<p class="lecturer">讲师：${video.speakerName}</p>
						<div class="v-info">
							<span class="count"><img src="${pageContext.request.contextPath}/img/count.png" alt="">${video.playNum}</span>
							<span class="duration"><img src="${pageContext.request.contextPath}/img/player.png" alt="">${video.showTime}</span>
						</div>
					</div>
				</c:forEach>
		
		
			</div>
		</div>  
           
    </div>



</div>
    
    <%@include file="../include/footer.jsp"%>

    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/js/video.js"></script>
    <script>
        $(function () {
        	var id = $('#videoId').val();
           $('#content').load('front/video/videoData.action?videoId='+id+'&subjectName=${subjectName}');
		});
    </script>
</body>

</html>
