<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="一根筋教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,一根筋教育,学习成就梦想！">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="icon" href="favicon.png" type="image/png" />
    <title>在线公开课-一根筋教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>

    <script>
       
    </script>
</head>

<body class="w100">
   
    <jsp:include page="../include/header.jsp"></jsp:include>
    
    <div id="app" >
        <!--banner图-->
        <div class="banner" style="background-image: url(${pageContext.request.contextPath}/img/banner-${subject.id}.jpg)"></div>

        <!--面包屑导航-->
        <div class="container mian-nav">公开课 / ${subject.subjectName}</div>

        <div class="classify">
            <div class="container">
                <!--章-->
                <c:forEach items="${subject.courseList}" var="course">
                   <div class="section" >
                    <div class="classifyName">
                        <p class="title title-first">${course.courseTitle}</p>
                    </div>
                    <div class="kcIntro">
                        <p class="int"><span>课程介绍：</span>${course.courseDesc}
                        </p>
                    </div>
                    <ul>
                        <!--节-->
                        <c:forEach items="${course.listVideo}" var="video" varStatus="i" >
                                 <li class="section-main"  onclick="getVideo(${video.id})">
		                            <div class="thum" style="background-image: url('${video.imageUrl}')">
		                                <!--http://vod.ygjedu.com/gkk/h5/c1/image/course/01.jpg-->
		                            </div>
		                            <p>
		                            <c:if test="${(i.index+1)>=10}">
		                                ${i.index+1}
		                            </c:if>
		                            <c:if test="${(i.index+1)<10}">
		                                0${i.index+1}
		                            </c:if>  ${video.title}</p>
		                            <div class="classify-v-info">
		                                <span class="count" title="观看次数"><img src="${pageContext.request.contextPath}/img/count.png" alt="">${video.playNum}</span>
		                                <span class="duration" title="视频时长"><img src="${pageContext.request.contextPath}/img/player.png" alt="">${video.showTime}</span>
		                            </div>
		                        </li> 
                        
                        </c:forEach>
                       

                    </ul>
                  </div>
                
                </c:forEach>
                

            </div>
            
        </div>
    </div>
    <!--页脚-->
     <%@include file="../include/footer.jsp"%>

    <!--登录注册弹出框-->
    <div class="mask hidden" id="login">
        <div class="mask_content">
            <div class="mask_content_header">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
            </div>
            <div class="mask_content_body">
                <form id="loginForm" action="#">
                    <h3>快速登录</h3>
                    <input type="email" id="loginEmail" placeholder="请输入邮箱" name="email">
                    <input type="password" id="loginPassword" placeholder="请输入密码" name="password">
                    <div id="forget">
                        <a href="${pageContext.request.contextPath}/user/forgetPassword.action">忘记密码？</a>
                        &#x3000;<a href="#" onclick="quickShow()">快速注册</a>
                    </div>
                    
                    <input type="submit" onclick="return commitLogin()" value="登&#x3000;录">
                </form>
            </div>
            <div class="mask_content_footer">
                <span id="login_close">关&#x3000;闭</span>
            </div>
        </div>
    </div>
    
    <div class="mask hidden" id="reg">
        <div class="mask_content">
            <div class="mask_content_header">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
            </div>
            <div class="mask_content_body">
                <form id="regForm" action="insertUser.action">
                    <h3>新用户注册</h3>
                    <input type="email" id="regEmail" placeholder="请输入邮箱" name="email"><span id="emailMsg"></span>
                    <input type="password" id="regPsw" placeholder="请输入密码" name="password">
                    <input type="password" id="regPswAgain" placeholder="请再次输入密码" name="psw_again"><span id="passMsg"></span>
                    <div id="yzm" class="form-inline">
                        <input type="text" name="yzm" style="width: 45%; display: inline-block;">
                        <div id="v_container" style="width: 45%;height: 40px;float:right;"></div>
                    </div>
                    <input type="submit" onclick="return commitRegForm();" value="注&#x3000;册">
                </form>
            </div>
            <div class="mask_content_footer">
                <span id="reg_close">关&#x3000;闭</span>
            </div>
        </div>
    </div>
    
    <!--<script src="${pageContext.request.contextPath}/js/readmore.js"></script>-->
    <script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
    

    
</body>

<script type="text/javascript">
    function getVideo(videoId){
        window.location.href="${pageContext.request.contextPath}/video/playVideo?videoId="+videoId+"&subjectName="+'${subject.subjectName}';
    }
</script>

</html>