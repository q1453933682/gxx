<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录心灵旅游</title>
<!--Custom Theme files-->
<link rel="shortcut icon" href="img/logo.png">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords" content="Register Login Widget template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login Signup Responsive web template, SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<h1>登录/注册</h1>
	<!-- main -->
	<div class="main">
		<!--login-profile-->
		
		<!--login-profile-->
		<!--signin-form-->
		<div class="w3" id="login">
			<div class="signin-form profile">
				<h3>登录</h3>
				
				<div class="login-form">
					<form>
						<input type="text" name="account" id="loginemail" placeholder="邮箱地址" required="">
						<input type="password" name="password" id="loginpwd" placeholder="密码" required="">
						<div class="tp">
							<input type="button" id="button" onclick="login()" value="马上登录">
						</div>
					</form>
				</div>
				<div class="header-social wthree">
							<a href="#" class="face"><h5>脸书</h5></a>
							<a href="#" class="goog"><h5>谷歌</h5></a>
							<div class="clear"></div>
						</div>
				<p><a href="javascript:void(0)" onclick="change('regist','login')"> 没有账号?马上注册</a></p>
			</div>
		</div>
		<div class="agile" id="regist" style="display:none">
			<div class="signin-form profile">
				<h3>注册</h3>
				
				<div class="login-form">
					<form>
						<!--  <input id="reguname" name="username" type="text"></div> -->
						<input type="text" name="name" id="reguname" placeholder="用户名" required="">
						<input type="password" name="password" id="regpwd" placeholder="密码" required="">
						<input type="password" name="password" id="rpwd" placeholder="确认密码" required="">
						<input type="text" name="email" id="email" placeholder="邮箱地址ַ" required="">
						<input type="text" name="code" id="code" placeholder="验证码" required="">
						<input type="button" id="button"  onclick="sendcode()" value="发送验证码">
						<input type="button" id="button"  onclick="reg()" value="立即注册">
					</form>
				</div>
				<p><a href="javascript:void(0)" onclick="change('login','regist')">点击注册，马上成为新用户</a></p>
				<p style="color:white">点击注册 即代表您已同意<a href="tiaokuan.jsp">&nbsp 条款</a></p>
			</div>
			<div id="code1" style="display:none">${code }</div>
		</div>
		<div class="clear"></div>
		<!--//signin-form-->	
	</div>
	<div class="copyright">
		<p> &copy; 2019 Register Login Widget . All rights reserved / Design by <a href="#" target="_blank" >yjh&Gxx</a></p>
	</div>
	
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script>
		function change(a,b){
			document.getElementById(a).style.display="block";
			document.getElementById(b).style.display="none";
		}
		
		function reg(){
			var email=$("#email").val();
			var uname=$("#reguname").val();
			var pwd=$("#regpwd").val();
			var rpwd=$("#rpwd").val();
			var code=$("#code").val();
			var code1=$("#code1").html();
			if(code==null || code==""){
				alert("请输入验证码！");
			}else{
				if(code!=code1){
					alert("验证码不正确！");
				}else{
					if(email==null || email=="" || uname==null || uname=="" || pwd==null || pwd==""|| rpwd==null || rpwd==""){
						alert("输入框不能为空！");
					}else{
						if(pwd!=rpwd){
							alert("两次输入的密码不一致");
						}else{
							$.post("userServlet",{
								op:"judge",
								email:email,
								pwd:pwd
							},function(data){
								if(data>0){
									$.post("userServlet",{
										op:'reg',
										email:email,
										uname:uname,
										pwd:pwd
									},function(data){
										if( data>0 ){
											alert("注册成功，即将跳转到登录页面!");
											location.href="login.jsp";
										     }else{
										    	 alert("注册失败");
										   	 }
									},"text");
								}else{
									alert("该用户已经存在！");
									$("#regpwd").val("");
									$("#rpwd").val("");
									$("#email").val("");
									$("#code").val("");
								}
							},"text");
						}
					}
				}
			}
		}
		
		function sendcode(){
			var email=$("#email").val();
			if(email==null||email==""){
				alert("请输您的邮箱地址！");
			}else{
				$.post("userServlet",{
					op:"sendcode",
					email:email
				},function(data){
					if(data>0){
						alert("验证码发送成功，请注意查收！");
						$("#code1").html(data);
					}else{
						alert("网络错误");
					}
				},"text");
			}
		}
		
		function login(){
	    	var email=$("#loginemail").val();
	    	var pwd=$("#loginpwd").val();
	    	
	    	if(email==null || email=="" || pwd==null || pwd==""){
	    		alert("邮箱或者密码不能为空");
	    	}else{
	    		$.post("userServlet",{
	    			op:'login',
	    			email:email,
	    			pwd:pwd
	    		},function(data){
	    			if(data==0){
	    				location.href="index.jsp";
	    			}else if(data==1){
	    				location.href="back/Manager.jsp";
	    			}else if(data==2){
	    				alert("该用户已经被封号，请联系管理员解封！")
	    			}else{
	    				alert("用户名或者密码错误");
	    			}
	    		},"text");  
	    	}
	    }
	</script>
</body>
</html>