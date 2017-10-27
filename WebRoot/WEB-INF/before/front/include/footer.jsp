<%@ page language="java" pageEncoding="UTF-8"%>
<!--页脚-->
<footer>
	<ul>
		<li>
			<img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" draggable="false">
		</li>
		<li class="mt25">
			<h3>各校区地址</h3>
			<ul>
				<li>总部地址<br>北京市海淀区西小口路18号新华创新大厦3层</li>
				<li>郑州校区<br>金水东路与黄河南路交叉口北100米，东方维景国际大酒店6楼</li>
				<li>深圳校区<br>深圳市南山区高新数字技术园区B2栋2楼</li>
			</ul>
		</li>
		<li class="mt25">
			<h3>联系我们</h3>
			<ul id="foo_icon">
				<li>中国-郑州郑东新区东方维景国际酒店6楼</li>
				<li>e-mail:xxx@ygjedu.com</li>
				<li>电话:400-900-2910 0371-65351501</li>
				<li class="erwei">
					<br>
					<div>
						<img class="weixin" src="${pageContext.request.contextPath}/img/footer_fuwuhao.jpg" style="width:135px;height:135px;" alt="" draggable="false">
						<img class="weibo" src="${pageContext.request.contextPath}/img/footer_weibo.png" style="width:135px;height:135px;" alt="" draggable="false">
					</div>
				</li>
			</ul>
		</li>
	</ul>
	<div class="record">一根筋教育 &copy; Copyright  2017京ICP备15052660号-4 &#X3000;北京佳诺明德教育信息咨询有限公司</div>
</footer>


<!--登录注册弹出框-->
<div class="mask hidden" id="login">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="${pageContext.request.contextPath}/img/header_logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="loginForm" action="#">
				<h3>快速登录</h3>
				<input type="email" id="loginEmail" placeholder="请输入邮箱" name="email">
				<input type="password" id="loginPassword" placeholder="请输入密码" name="password">
				<div id="forget">
					<a href="user/forgetPassword">忘记密码？</a>
				</div>
				<input type="button" class="btn" onclick="commitLogin()" value="登&#x3000;录">
			</form>
		</div>
		<div class="mask_content_footer">
			<span id="login_close">关&#x3000;闭</span>
		</div>
	</div>
</div>

<style type="text/css">
    .btn{
        width: 220px;
	    height: 40px;
	    margin: 10px auto;
	    background-color: #1f2d5c;
	    border: none;
	    color: #fff;
	    cursor: pointer;
    }
</style>
<div class="mask hidden" id="reg">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="${pageContext.request.contextPath}/img/header_logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="regForm" >
				<h3>新用户注册</h3>
				<input type="email" id="regEmail" placeholder="请输入邮箱" name="email"><span id="emailMsg"></span>
				<input type="password" id="regPsw" placeholder="请输入密码" name="password">
				<input type="password" id="regPswAgain" placeholder="请再次输入密码" name="psw_again"><span id="passMsg"></span>
				<div id="yzm" class="form-inline">
					<input type="text" name="yzm" style="width: 45%; display: inline-block;">
					<div id="v_container" style="width: 45%;height: 40px;float:right;"></div>
				</div>
				<input type="button" class="btn"  onclick="commitRegForm()" value="注&#x3000;册">
			</form>
		</div>
		<div class="mask_content_footer">
			<span id="reg_close">关&#x3000;闭</span>
		</div>
	</div>
</div>
