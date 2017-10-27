
// 导航栏
$('nav').children('div').children('ul').children('li').mouseenter(function () {
    $('nav').children('div').children('ul').children('li').removeClass('nav_choose');
    $(this).addClass('nav_choose');
});
$('nav').mouseleave(function () {
    $('nav').children('div').children('ul').children('li').removeClass('nav_choose');
    $('#gkk').addClass('nav_choose');
});

// 导航栏下拉菜单
$('nav .nav_down').mouseenter(function () {
    $('#nav_down').stop().slideDown();
    $(this).children('img').attr('src', 'img/nav_down2.png');
});
$('nav .nav_down').mouseleave(function () {
    $('#nav_down').stop().slideUp();
    $(this).children('img').attr('src', 'img/nav_down.png');
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $('#top').fadeIn();
        $('body').css('paddingTop', '90px');
        $('nav').css({
            'position': 'fixed',
            'top': '0',
            'left': '0',
            'border-bottom': '1px solid #e6e6e6'
        });
    }
    else {
        $('body').css('paddingTop', '0');
        $('nav').css({
            'position': 'initial',
            'top': '0',
            'left': '0',
            'border-bottom': 'none'
        });
    }
});
// 登录注册显示和消失弹出框
$('#reg_open').click(function () {
    $('#reg').removeClass('hidden');
});
$('#login_open').click(function () {
    $('#login').removeClass('hidden');
});
$('#reg_close').click(function(){
    $('#reg').addClass('hidden');
});
$('#login_close').click(function(){
    $('#login').addClass('hidden');
});


// 报名
$("#iform .button").click(function (ev) {
    ev.preventDefault();

    var input1 = $('.form-control:eq(0)').val();
    var input2 = $('.form-control:eq(1)').val();
    var input3 = $('.form-control:eq(2)').val();
    var reg2 = /^1[3578]\d{9}$/;
    var reg3 = /^[1-9]\d{4,10}$/;

    if (input1 == "") {
        alert("姓名不能为空");
    } else if (!reg2.test(input2)) {
        alert("手机格式不符！！请重新填写！");
    } else if (!reg3.test(input3)) {
        alert("QQ格式不符！！请重新填写！");
    } else {
        $("#iform").submit();
    }

});


// 获取url路径中的参数
function GetUrlParam(paraName) {
    var url = document.location.toString();
    var arrObj = url.split("?");

    if (arrObj.length > 1) {
        var arrPara = arrObj[1].split("&");
        var arr;
        for (var i = 0; i < arrPara.length; i++) {
            arr = arrPara[i].split("=");

            if (arr != null && arr[0] == paraName) {
                return arr[1];
            }
        }
        return "";
    }
    else {
        return "";
    }
}




//==========================Java03班升级JS===============================


var verifyCode = new GVerify("v_container");

var regIsEmail =false; //邮箱校验的结果
var regIsPwd  =false;  //密码校验结果

//不乐意  光标失去事件
$("#regEmail").blur(function(){
	//获取值
	var emailVal=$(this).val();
	if(null!=emailVal && ""!=emailVal){
		//三个参数
		var params={"email":emailVal};
		$.post("user/validateEmail",params,function(data){
			 //alert(data);
			 if(data=="success"){
				 regIsEmail= true;
				 $("#emailMsg").text("该邮箱可用").css({"color":"green"});
			 }else{
				 regIsEmail =false;
				 $("#emailMsg").text("该邮箱已被注册").css({"color":"red"});
			 }
		});
	}
});

//校验密码
$("#regPswAgain").blur(function(){
	var pass01 =$("#regPsw").val();
	var pass02=$(this).val();
	if(null==pass01 || ""==pass01 || null==pass02 || ""==pass02 ){
		regIsPwd  =false;
		$("#passMsg").text("密码不能为空").css("color","red");
	}else{
		if(pass01!=pass02){
			regIsPwd  =false;
			$("#passMsg").text("密码不一致，请重新输入").css("color","red");
		}else{
			regIsPwd  =true;
			$("#passMsg").text("");
		}
	}
});

//注册功能
function commitRegForm(){
	
	// 邮箱是否可用   密码是否一致  验证码是否正确
	var code =$("input[name='yzm']").val();
	
	if(regIsPwd && regIsEmail && verifyCode.validate(code)) {
		
		//通过ajax提交表单  手动练习
		//var params={"email":email,"password":password}
		//表单序列化的目的是将表单中的所有填写的字段封装成为数据，提交给后台，适用于字段比较多的表单提交使用
		$.ajax({
			url:"user/insertUser",        //请求地址
		    data:$("#regForm").serialize(),  //参数
		    type:"POST",
		    success:function(data){ 
		    	//alert(data);
		    	$("#reg").addClass("hidden");//隐藏注册界面
		    	$("#account").text($("#regEmail").val());
		    	$("#regBlock").css("display","none");
		    	$("#userBlock").css("display","block");
		    	
		    },
		    error:function(){
		    	alert("联系管理员");
		    }
		});
		
	}else{
		alert("b");
		
	}
}

//登录
function commitLogin(){
	
	var email =$("#loginEmail").val();
	var password=$("#loginPassword").val();
	if(email!="" && password!=""){
		//表单序列化
		var params=$("#loginForm").serialize();
		$.post("user/loginUser",params,function(data){
			if(data=='success'){
				$("#login").addClass("hidden");//隐藏注册界面
		    	$("#account").text($("#loginEmail").val());
		    	$("#regBlock").css("display","none");
		    	$("#userBlock").css("display","block");
			}
		});
	}
	
}



