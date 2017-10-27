<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/forget_password.css">
    <link rel="icon" href="favicon.png" type="image/png">
    <title>在线公开课-一根筋教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body>
    <header>
        <div class="container">
            <img src="img/header_logo.png" alt="一根筋">
        </div>
    </header>
    <main>
        <div class="container">
            <form class="ma" action="front/user/validateEmailCode.action">
                <div class="form_header">
                    <div class="form_title">
                        <h2>忘记密码</h2>
                        <span>通过注册邮箱重设密码</span>
                    </div>
                    <div class="form_back">
                        <a href="index.jsp">返回立即登录</a>
                    </div>
                </div>
                <div class="form_body">
                    <input type="email" placeholder="请输入登录邮箱" name="email">
                    <input type="text" placeholder="请输入验证码" name="code"><input type="button" id="yzmBtn" value="发邮件获取验证码"/>
                    <input type="submit" value="提交" onclick="return commitForm()";>
                </div>
                <div class="form_footer">
                    <div class="FAQ">
                        <span>收不到邮件？查看</span><a href="#">常见问题</a>
                    </div>
                </div>
            </form>
        </div>
    </main>
<%@include file="../include/script.html"%>
    <script type="text/javascript">
		$("#yzmBtn").click(function(){
		  
		   var email =$("input[name='email']").val();
		    alert("aaa:"+email);
		   if(null!=email && email !=""){
		      //ajax
		      var params ={"email":email};
		     $.post("user/sendEmail",params,function(data){
		          if(data=='success'){
		             alert("邮箱发送成功，请注意查收");
		          }
		      }); 
		      
		      //倒计时  计时器
		      var time=60;
		      var timer =setInterval(function(){
		      
		        if(time<=0){
		            clearInterval(timer);
		            $("#yzmBtn").removeAttr("disabled").css("background","#576282");
		            $("#yzmBtn").val("发邮件获取验证码");
		        }else{
		            
		            $("#yzmBtn").attr("disabled","disabled").css("background","gray");
		            $("#yzmBtn").val(time+"s后重新获取");
		            time--;
		        }
		        
		      }, 1000);
		   
		   }else{
		      alert("请输入邮箱再发送验证码");
		   }
		});
    </script>
</body>

</html>