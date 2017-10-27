<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="y" uri="http://www.yanzhenwei.com/common/" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
       th{
          text-align:center;
       }
    </style>
  </head>
  <body>
  
   
	       <nav class="navbar-inverse">
		      <div class="container">
		        <!-- Brand and toggle get grouped for better mobile display -->
		        <div class="navbar-header">
		          
		          <a class="navbar-brand" href="#">视频管理系统</a>
		        </div>
		
		        
		        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
		          <ul class="nav navbar-nav">
		            <li class="active"><a href="#">视频管理</a></li>
		            <li><a href="#">主讲人</a></li>
		            <li><a href="#">课程管理</a></li>
		          </ul>
		           <p class="navbar-text navbar-right">
		            <span>欢迎您，${sessionScope.username}</span>&nbsp;<i class="glyphicon glyphicon-log-in"></i>&nbsp;&nbsp;<a href="loginOut.action" class="navbar-link">退出</a>
		           </p>
		        </div>
		        
		       
		      </div>
		    </nav>
		    
		    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		       <div class="container" >
		           <h2>视频管理</h2>
		       </div>
			  
			</div>
	  
	         <div class="container" >
		          <div class="row">
		             <div class="col-md-3">
		                  <a href="editVideo.action?id=-1"><button type="button" class="btn btn-info" >添加</button></a>
                         <button type="button" id="batchDelBtn" class="btn btn-primary">批量删除 <span  class="badge">0</span></button>
		             </div>
		               <div class="col-md-3">
		               </div>
                       <div class="col-md-6">
                           
                           <form class="form-inline navbar-right" action="showVideo.action" method="post">
							  
							  <div class="form-group">
							    
							    <input type="text" class="form-control" name="title" placeholder="标题">
							  </div>
							  
							   <div class="btn-group">
								  <button type="button" id="speakerNameId" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    --选择老师--<span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu">
								  
								   <c:forEach items="${speakerList}" var="speaker">
								       <li ><a onClick="showName(this,${speaker.id},1)">${speaker.speakerName}</a></li>
								   </c:forEach>
								  </ul>
								  <input name="spearkerId" id="speakerId" type="hidden" value="0" />
								</div>
								
								<div class="btn-group">
								  <button type="button" id="courseNameId" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    --选择课程--<span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu">
								    
								    <c:forEach items="${courseList}" var="course">
								       <li><a onClick="showName(this,${course.id},2)">${course.courseTitle}</a></li>
								   </c:forEach>
								    
								  </ul>
								  <input name="courseId" id="courseId" type="hidden" value="0"/>
								</div>
							  
							  
							  <button type="submit" class="btn btn-info">查询</button>
							</form>
                       
		               </div>   
		          </div>
		     </div>
		     
		     <div class="container" style="margin-top:20px;">
		     
		       <form action="batchDelete.action" method="post" id="deleteForm">
		       
		       
		         <table class="table table-bordered table-hover"
		          style="text-align:center"
		         >
                       <thead >
                          <tr class="active">
                            <th>
                              <input type="checkbox" id="checkAll"/>
                            </th>
                            <th>序号</th>
                            <th width="15%">名称</th>
                            <th width="45%">描述</th>
                            <th>讲师</th>
                            <th>时长</th>
                            <th>播放次数</th>
                            <th>编辑</th>
                            <th>删除</th>
                          </tr>
                       </thead>
                       <tbody>
                         <c:forEach items="${page.rows}" var="video" varStatus="index">
                             <tr>
                             <td><input type="checkbox" name="ids" value="${video.id}"  class="ids"/></td>
                             <td>${index.count}</td>
                             <td>${video.title}</td>
                             <td>${video.detail}</td>
                             <td>${video.speakerName}</td>
                             <td>${video.showTime}</td>
                             <td>${video.playNum}</td>
                             <td><a href="editVideo/${video.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                              <td><a  href="#" onclick="confirmModel(this,'${video.title}',${video.id})"><span class="glyphicon glyphicon-trash" ></span></a></td>
                            </tr>
                         </c:forEach>
                           
                           
                       </tbody>
				  </table>
				 </form>
				 <div class="text-right" >
		             <y:page url="showVideo.action"></y:page>
		         </div>
				 
		     </div>
         

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/confirm.js"></script>
    <script type="text/javascript">
      
      var deleteNum=0;
      $(function(){
          
          $("#batchDelBtn").click(function(){
             // alert("haha");
             if(deleteNum!=0){
                
                Confirm.show('温馨提示', '您确定要删除这'+deleteNum+'条数据吗？', {
                '确定': {
                    'primary': true,
                    'callback': function() {
                         $("#deleteForm").submit();
                    }
                }
            });
                
               
             }else{
                alert("请选择要删除的数据");
             }
              
          });
      
          $("#checkAll").click(function(){
              //jquery获取checkbox的值
              var value=$("#checkAll").prop("checked");
              //alert(value);
              var arr =$(".ids");
              //alert(arr.length);
              $(".ids").prop("checked",value);
              if(value){
                 deleteNum=arr.length;
                 $(".badge").text(arr.length);
              }else{
                 deleteNum=0;
                 $(".badge").text(0);
              }
          });
          
          $(".ids").click(function(){
              if($(this).is(":checked")){
                deleteNum++;
              }else{
                deleteNum--;
              }
              
              if(deleteNum==0){
                 $("#checkAll").prop("checked",false);
              }
              
              if(deleteNum==$(".ids").length){
                 $("#checkAll").prop("checked",true);
              } 
              
              $(".badge").text(deleteNum);
          });
      });
    
      
      function showName(obj,id,type){
         //alert(id+","+$(obj).text());
         if(type==1){
            $("#speakerId").val(id);
            $("#speakerNameId").html($(obj).text()+"<span class='caret'></span>");
         }else{ 
            $("#courseId").val(id);
            $("#courseNameId").html($(obj).text()+"<span class='caret'></span>");
         }
         
         
      }
    
      function confirmModel(obj,title,id){
          // alert(title);
           Confirm.show('温馨提示', '您确定要删除'+title+'吗？', {
                '确定': {
                    'primary': true,
                    'callback': function() {
                        //使用ajax删除数据
                        var params={"id":id};
                        $.post("deleteVideo.action",params,function(data){
                        
                            if(data=='success'){
                               //通过js删除tr节点
                               $(obj).parent().parent().remove();//$(obj) 获取的是a,$(obj).parent() 获取td
                               Confirm.show('温馨提示', '删除成功！');
                            }else{
                               Confirm.show('温馨提示', '删除失败！');
                            }
                            
                        });
                        
                    }
                }
            });
      }
       
      
    </script>
  </body>
</html>