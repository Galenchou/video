<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <base href="${pageContext.request.contextPath}/">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="一根筋教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,一根筋教育,学习成就梦想！">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="icon" href="favicon.png" type="image/png">
    <title>在线公开课-一根筋教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body class="w100">
    <jsp:include page="uheader.jsp"></jsp:include>
    <main>
        <div class="container">
            <h2>我的资料</h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <li><a href="front/user/profile.action">更改资料</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="front/user/avatar.action">更改头像</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="front/user/password.action">密码安全</a></li>
                </ul>
                <div class="proflle_tab_body">
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                            <c:if test="${empty user.imgurl}">
                                <img  src="img/avatar_lg.png">
                            </c:if>

                            <c:if test="${not empty user.imgurl}">
                                <img width="200px" height="200px" src="${user.imgurl}">
                            </c:if>
                        </div>
                        <div class="profile_ifo_area">
                            <form action="updateUser.action">
                                <input name="id" type="hidden" value="${user.id}">
                                <div class="form_group">
                                    <span class="dd">昵&#x3000;称：</span><input type="text" name="nickname" value="${user.nickname}" >
                                </div>
                                <div class="form_group">
                                    <span class="dd">性&#x3000;别：</span>
                                    <input type="radio" id="man" value="man" name="sex"><label for="man">男</label>
                                    <input type="radio" id="woman" value="woman" name="sex"><label for="woman">女</label>
                                </div>
                                <div class="form_group">
                                    <span class="dd">生&#x3000;日：</span>  <!-- 1990-10-04 -->
                                    <input type="text"  name="birthday" value="${user.birthday}">
                                </div>
                                <div class="form_group">
                                    <span class="dd">邮&#x3000;箱：</span>
                                    <span >${user.email}</span>
                                </div>
                                <div class="form_group">
                                    <span class="dd">所在地：</span>
                                    <div id="city">
                                        <select class="prov" name="prov"></select>
                                        <select class="city" disabled="disabled" name="city"></select>
                                    </div>
                                    <input type="hidden" name="address" id="address"/>
                                </div>
                                <div class="form_submit dd">
                                    <input type="submit" onclick="return commitForm();"  value="保&#x3000;存">
                                    <a href="changeProfile.action">重置</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="ufooter.jsp"></jsp:include>
    <%@include file="../include/script.html"%>
    <script src="js/jquery.cityselect.min.js"></script>
    <script type="text/javascript">

		
    </script>
</body>

</html>