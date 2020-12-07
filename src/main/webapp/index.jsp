<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>智慧校园</title>
		<link rel="stylesheet" type="text/css" href="CSS/layui.css" />	
		<link rel="stylesheet" type="text/css" href="CSS/login.css" />
		<script src="JS/jquery.min.js"></script>
		<script src="JS/jquery.validate.min.js"></script>
	</head>

	<body>
		<div id="tip" style="position: absolute;top: 40%;left: 40%;z-index: 11111;width: 20%; height: 10%;background-color: rgb(0,0,0,0.5);text-align: center;line-height: 70px;color: red;display: 
<%
	if(request.getAttribute("errorMsg")==null){
		out.print("none");
	}else{
	String Msg = (String)request.getAttribute("errorMsg");
	if(Msg.indexOf("错")!=-1){
		out.print("block");
	}else{
		out.print("none");
	}
	}
%>
;">
			<!-- 账号或密码输入错误！ -->
			${errorMsg} 
		</div>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>智慧校园</h3>
				<div class="m-login-warp">
					<form class="layui-form" action="/Smart/LoginOrLogoutServlet?method=login" onsubmit="return checkForm()" method="post">
						<div class="layui-form-item">
							<input type="text" id="id" name="id" required lay-verify="required" placeholder="UserId" onclick="clearTip()" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" id="password" name="password" required lay-verify="required" placeholder="PassWord" onclick="clearTip()" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<input type="text" id="verity" name="verity" required lay-verify="required" placeholder="Code" onclick="clearTip()" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline">
								<img class="verifyImg" onclick="this.src=this.src+'?c='+Math.random();" src="/Smart/VerifyCodeServlet" />
							</div>
						</div>
						<div class="layui-form-item m-login-btn">
							<div class="layui-inline">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
							</div>
							<div class="layui-inline">
								<button type="reset" class="layui-btn layui-btn-primary">取消</button>
							</div>
						</div>
					</form>
				</div>
				<p class="copyright">Copyright 2020 </p>
			</div>
		</div>
		
	</body>
<script>
	function checkForm(){
		if(!checkID($("#id").val().trim())){
			return false;
		};
		if(!checkPassword($("#password").val().trim())){
			return false;
		};
		if(!checkVerity($("#verity").val().trim())){
			
			return false;
		}else{
			return ture;
		};
		return false;
	}
	function checkID(id){//账号的检查
		if(id.length==5||id.length==11){//长度
			return true;
		}
		SetMag("账号或密码错误！");
		return false;
	}
	function checkPassword(password){//密码的检查
		if(password.length>5||password.length<17){//长度
			return true;
		}
		SetMag("账号或密码错误！");
		return false;
	}
	function checkVerity(verity){//密码的检查
		if(verity.length==4){//长度
			return true;
		}
		SetMag("验证码错误！");
		return false;
	}
	function SetMag(MSG){//展示错误信息
		$("#tip").css("display","block");
		$("#tip").text(MSG);
	}
	function clearTip(){
		$("#tip").css("display","none");
	}
</script>
</html>