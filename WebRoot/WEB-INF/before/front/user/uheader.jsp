<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<header>
	<div class="container top_bar clearfix">
		<img src="img/header_logo.png" >
		<div id="tele">
			<span>0371-65351501</span>
			<span>400-900-2910</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a href="index.action">首页</a></li>
				<%--<li><a href="${pageContext.request.contextPath}/index.jsp">课程</a></li>
				<li><a href="#">关于我们</a></li>--%>
				<li class="menu_active"><a href="front/user/index.action">个人中心</a></li>
			</ul>
			<%--<div id="search_group">
				<input type="text" placeholder="搜索课程;">
				<span id="search"></span>
			</div>--%>
			<div id="user_bar">
				<a href="front/user/index.action">
					<c:if test="${empty user.imgurl}">
						<img id="avatar" src="img/avatar_lg.png" alt="">
					</c:if>

					<c:if test="${not empty user.imgurl}">
						<img id="avatar" src="${user.imgurl}" alt="">
					</c:if>

				</a>
				<a href="front/user/logout.action" id="lay_out">退出</a>
			</div>
		</div>
	</menu>
</header>
