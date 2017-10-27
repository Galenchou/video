<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <base href="${BaseContext}">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>
     <!-- 如果IE版本小于9，加载以下js,解决低版本兼容问题 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/confirm.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/message_cn.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
     ${pageContext.request.contextPath}
     <form action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
     <div style="margin-top: 20%;">
     	
     	<img src="${pageContext.request.contextPath}/img/header_logo.png" class="img-responsive center-block" style="width: 20%" alt="Responsive image">
     	
     	
     	<div class="container" style="margin-top: 10px;">
     	
     	 <div class="row">
     	 	 <div class="col-md-4"></div>
     	 	 <div class="form-group col-md-4" style="1px solid #5CB85C">
		    
		      <input type="text" class="form-control" name="username" style="border:1px solid #5CB85C" id="exampleInputEmail1" placeholder="用户名">
		    </div>
     	 	<div class="col-md-4"></div>
     	 </div>
     	 
     	 <div class="row">
     	 	 <div class="col-md-4"></div>
     	 	 <div class="form-group col-md-4">
		    
		         <input type="password" class="form-control" name="password" style="border:1px solid #5CB85C" id="exampleInputPassword1" placeholder="密码">
		    </div>
		    <div class="col-md-4"></div>
     	 	
     	 </div>
     	  
     		
     	</div>
     	
     	
     	<div class="row">
     	 	 <div class="col-md-4"></div>
     	 	 <div class="col-md-4" >
		        &nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success center-block" style="width:80%;" > 登 录 </button>
		    </div>
		    <div class="col-md-4"></div>
     	 	
     	 </div>
     	
     	  
     </div>
    </form>

  </body>
</html>