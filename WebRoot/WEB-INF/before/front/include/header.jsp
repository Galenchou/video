<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<header>
	<div class="container">
		<span>欢迎来到一根筋教育——佳诺明德旗下品牌</span>



		<c:if test="${not empty sessionScope._userAccount}">
			<div id="userBlock" style="float:right">
				<a href="user/logout.action">退出</a>
				<a href="user/index.action?email=${sessionScope._userAccount}" id="account">${sessionScope._userAccount}</a>
			</div>
		</c:if>
		<c:if test="${empty sessionScope._userAccount}">
		     <div id="userBlock" style="float:right;display:none;">
				<a href="user/logout.action">退出</a>
				<a href="user/index.action" id="account">${sessionScope._userAccount}</a>
			</div>
			<div id="regBlock" style="float:right">
				<a href="javascript:;" id="reg_open"><img src="${pageContext.request.contextPath}/img/we.png">注册</a>
				<a href="javascript:;" id="login_open"><img src="${pageContext.request.contextPath}/img/we.png">登录</a>
			</div>
		</c:if>

		<a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/img/sc.png" draggable="false">加入收藏</a>
		<%--<a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2580094677&site=qq&menu=yes"><img src="img/we.png" draggable="false">联系我们</a>--%>
		<a target="_blank" href="admin/login.action"><img src="${pageContext.request.contextPath}/img/we.png" draggable="false">后台管理</a>
		<a class="color_e4"><img src="${pageContext.request.contextPath}/img/phone.png" draggable="false"> 0371-65351501&#x3000;&#x3000;400-900-2910</a>

	</div>
</header>
