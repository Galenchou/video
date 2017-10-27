<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <base href="${BaseContext}">
	  <meta charset="utf-8">
    
    <!--表示使用IE最新的渲染模式进行解析-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加或修改视频</title>
		<!-- 如果IE版本小于9，加载以下js,解决低版本兼容问题 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/confirm.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/message_cn.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
	  th{
		 text-align: center;
	  }
    </style>
  </head>
  <body>
  	
  	<nav class="navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="admin/video/index.action">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			 id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li class="active"><a href="admin/video/index.action">视频管理</a></li>
				<li ><a href="admin/speaker/index.action">主讲人管理</a></li>
				<li ><a href="admin/course/index.action">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>admin</span> <i class="glyphicon glyphicon-log-in"
														 aria-hidden="true"></i>&nbsp;&nbsp;<a href="admin/logout.action"
																							   class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->


	</div>
	<!-- /.container-fluid -->
</nav>
    
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">
	      <c:if test="${video.id !=null}">
	          <h2>修改视频信息</h2>
	      </c:if>
	      <c:if test="${video.id ==null}">
	          <h2>添加视频信息</h2>
	      </c:if>
	          
	      
	      
	  </div>
	</div>

	<div class="container" style="margin-top: 20px;">
		
		  <form id="infoForm" class="form-horizontal" action="saveOrUpdateVideo.action" method="post">
		      
		      <input type="hidden" name="id" value="${video.id}"  />
		      <%-- <input type="hidden" name="playNum" value="${video.playNum}" /> --%>
			  <div class="form-group">
			    <label for="title" class="col-sm-2 control-label">视频标题</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name="title" value="${video.title}"  placeholder="视频名称">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="speakerId" class="col-sm-2 control-label">主讲人</label>
			    <div class="col-sm-10">

					<select name="spearkerId" id="speakerId" class="form-control">
						<option value="0">请选择讲师</option>
						  <c:forEach items="${speakerList}" var="speaker">
						     
								   <option value="${speaker.id}"  
								      <c:if test="${speaker.id==video.spearkerId}">selected</c:if> >
								     ${speaker.speakerName}
								   </option>
						  </c:forEach>
					</select>

			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="courseId" class="col-sm-2 control-label">所属课程</label>
			    <div class="col-sm-10">


						<select name="courseId" id="courseId" class="form-control">
							<option value="0">请选择所属课程</option>
							  
							   <c:forEach items="${courseList}" var="course">
						     
								   <option value="${course.id}"  
								      <c:if test="${course.id==video.courseId}">selected</c:if> >
								        ${course.courseTitle}
								   </option>
						       </c:forEach>
							
						</select>
						
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="time" class="col-sm-2 control-label">视频时长(秒)</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" id="time" name="time" value="${video.time}"  placeholder="精确到秒（正整数）">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="imageUrl" class="col-sm-2 control-label">封面图片地址</label>
			    <div class="col-sm-10">
			      <input type="url" id="imageUrl" name="imageUrl" class="form-control" value="${video.imageUrl}"  placeholder="具体的url">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="videoUrl" class="col-sm-2 control-label">视频播放地址</label>
			    <div class="col-sm-10">
			      <input type="url" id="videoUrl" name="videoUrl" class="form-control" value="${video.videoUrl}"   placeholder="具体的url">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="detail" class="col-sm-2 control-label">备注</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" id="detail" name="detail" rows="3">
			         ${video.detail}
			      </textarea>
			    </div>
			  </div>

			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">保存</button>
			    </div>
			  </div>
			</form>
		
	</div>

  </body>
</html>
