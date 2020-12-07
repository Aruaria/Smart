<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="font_pyz8dbk7x3/iconfont.css" />
		<style>
			body,ul{
				list-style-type: none;
				overflow: hidden;
				margin: 0;
				border: 0;
				padding: 0;
				font-family: "宋体";
			}
			#tbody{
				position: absolute;
				width: 100%;
				height: 100%;
				transition: left 0.5s;
			}
			cite{
				font-style: normal;
				display: inline-block;
				height: 20px;
				width: 130px;
				overflow: hidden;
			}
			li{
				list-style-type: none;
				display: block;
				width: 100%;
			}
			dl{
				padding: 5px 0;
				margin: 0;
			}
			.navigation{
				position: fixed;
				background-color: rgba(0,0,0,0.9);
				width: 200px;
				height: 100%;
				overflow: hidden;
				z-index: 100;
			}
			.navigation-ul{
				width: 220px;
				height: 600px;
				overflow-y: scroll;
			}
			.navigation-li{
				font-size: 17px;
			}
			.navigation-li-ty{
				display: inline-block;
				overflow: hidden;
				position: relative;
				top: -5px;
				margin-top: -100px;
				width: 12px;
				height: 6px;
				line-height: 45px;
			}
			.navigation-li-a{
				color:rgba(255,255,255,.8);
				text-decoration: none;
				display: block;
				padding: 8px 0 8px 0;
				height: 25px;
				padding: 15px 10px;
			}
			.navigation-li-a:hover{
				color:rgba(255,255,255,1);
			}
			.navigation-dl{
				background-color: rgba(0,113,194,.8);
				display: none;
			}
			.navigation-dl a{
				color:rgba(255,255,255,.8);
			}
			.navigation-dl-dd{
				margin:0;
				padding:10px 0 5px 40px ;
			}
			.navigation-dl cite:hover{
				color:rgba(255,255,255,1);
			}
			.sign{
				display: block;
				border-style: solid dashed dashed dashed;
				border-color: rgba(255,255,255,.8) transparent rgba(255,255,255,.8) transparent;
				border-width: 6px;
				width: 0;
				height: 0;
				overflow: hidden;
				margin-top: -6px;
				transition: all 0.5s;
			}
			#stamp{
				position: absolute;
				top: 50px;
				left: 0px;
				height: 0px;
				width: 5px;
				background-color: rgb(70,98,217);
				transition: all 0.5s;
			}
			#Headmark{
				position: absolute;
				top: 0;
				margin-left: 200px;
				width: 100%;
				height: 50px;
				background-color: rgb(255,255,255);
				box-shadow:5px 5px 5px #888888;
			}
			.Headmark-information{
				display: inline-block;
				/* position: absolute;
				top: 20px; */
				/* right: 1%; */
			}
			#time{
				
				width: 500px;
				height: 100%;
				line-height: 70px;
			}
			#user{
				position: relative;
				left: 20%;
			}
			#LoginStatus{
				position: relative;
				left: 20%;
				cursor: pointer;
			}
			#LoginStatus>a{
				text-decoration: none;
				font-weight: 1000;
				font-size: 15px;
			}
			#LoginStatus>a:hover{
				color:red;
			}
		</style>
	</head>
	<body style="height: 100%;width: 100%;" onresize="resizeCheng()">
		<div id="tbody">
			<div class="navigation">
				<div style="width: 200px;height: 20px;padding:15px 0;text-align: center;cursor: pointer;">
					<span style="color:rgba(255,255,255,.8);font-size: 18px;line-height: 20px;font-weight: 500;">智慧校园</span>
				</div>
				<div id="stamp"></div>
				<ul class="navigation-ul">
				<li class="navigation-li" onmouseover="stamp(this)">
					<a href="javascript:void(0);" onclick="dropdown(this)" data-state="0" class="navigation-li-a">
						<span class="iconfont icon-home"></span>
						<cite>主页</cite>
						<div class="navigation-li-ty">
							<span class="sign"></span>
						</div>
					</a>
					<dl class="navigation-dl">
						<dd class="navigation-dl-dd" onclick="spread(this,1)">
							<a href="javascript:void(0);">
								<cite>
								<c:if test="${!empty   admin}">综合概况</c:if>
								<c:if test="${empty   admin}">我的信息</c:if>
								
								</cite>
							</a>
						</dd>
					</dl>
				</li>
				<!-- 学生的看自己的信息 -->
				<c:if test="${!empty   student}">
				<li class="navigation-li" onmouseover="stamp(this)">
					<a href="javascript:void(0);" onclick="dropdown(this)" data-state="0" class="navigation-li-a">
						<span class="iconfont icon-all"></span>
						<cite>应用</cite>
						<div class="navigation-li-ty">
							<span class="sign"></span>
						</div>
					</a>
					<dl class="navigation-dl">
						<dd class="navigation-dl-dd"  onclick="spread(this,2)">
							<a href="javascript:void(0);">
								<cite>我的成绩</cite>
							</a>
						</dd>
					</dl>
				</li>
				</c:if>
				<!-- 超管管理普管 -->
				<c:if test="${admin.adminName=='超级管理员'}">
				<li class="navigation-li" onmouseover="stamp(this)">
					<a href="javascript:void(0);" onclick="dropdown(this)" data-state="0" class="navigation-li-a">
						<span class="iconfont icon-all"></span>
						<cite>应用</cite>
						<div class="navigation-li-ty">
							<span class="sign"></span>
						</div>
					</a>
					<dl class="navigation-dl">
						<dd class="navigation-dl-dd"  onclick="spread(this,2)">
							<a href="javascript:void(0);">
								<cite>管理员设置</cite>
							</a>
						</dd>
					</dl>
				</li>
				</c:if>
				<!-- 管理员查看学生 -->
				<c:if test="${!empty   admin}">
					<li class="navigation-li" onmouseover="stamp(this)">
					<a href="javascript:void(0);" onclick="dropdown(this)" data-state="0" class="navigation-li-a">
						<span class="iconfont icon-integral"></span>
						<cite>查询学生</cite>
						<div class="navigation-li-ty">
							<span class="sign"></span>
						</div>
					</a>
					<dl class="navigation-dl">
						<dd class="navigation-dl-dd"  onclick="spread(this,3)">
							<a href="javascript:void(0);">
								<cite>学生成绩</cite>
							</a>
						</dd>
						<dd class="navigation-dl-dd"  onclick="spread(this,4)"> 
							<a href="javascript:void(0);">
								<cite>学生信息</cite>
							</a>
						</dd>
					</dl>
				</li>
				</c:if>
				
			</ul>
			</div>
			
			<div id="Headmark">
				<div id="time" class="Headmark-information">当前时间：<span id="time_">00:00:00</span></div>
				<div id="user" class="Headmark-information">当前用户：${student.xm}${admin.adminName}</div>
				<div id="LoginStatus" class="Headmark-information">
					<a href="/Smart/LoginOrLogoutServlet?method=logout">注销</a>
				</div>
			</div>
			
			<div id="ifbody" style="position: absolute;top: 50px;left: 200px;overflow-y: auto;margin: 0 auto;overflow: hidden;">
				<iframe src="/Smart/views/welcome.html" id="ifr">
					
				</iframe>
			</div>
		</div>
		<script>
			resizeCheng();
			//界面缩放调整
			function resizeCheng(){
				var zWidth = document.body.clientWidth;
				var zHeight = document.documentElement.clientHeight;
				if(zWidth<1100){
					document.getElementById("tbody").style.left="-200px";
					document.getElementById("Headmark").style.left="200px"
					document.getElementById("ifbody").style.width=(zWidth)+"px";
					document.getElementById("ifbody").style.height=(zHeight-50)+"px";
					document.getElementById("ifr").style.width=(zWidth+20)+"px";
					document.getElementById("ifr").style.height=(zHeight-30)+"px";
					document.getElementsByClassName("navigation-ul")[0].height=(zHeight-30)+"px";
				}else{
					document.getElementById("tbody").style.left="0";
					document.getElementById("Headmark").style.left="0"
					document.getElementById("ifbody").style.width=(zWidth-200)+"px";
					document.getElementById("ifbody").style.height=(zHeight-50)+"px";
					document.getElementById("ifr").style.width=(zWidth-180)+"px";
					document.getElementById("ifr").style.height=(zHeight-30)+"px";
					document.getElementsByClassName("navigation-ul")[0].height=(zHeight-30)+"px";
				}
				
				
			}
			//打开关闭下拉列表
			function dropdown(doc){
				var lis = doc.parentElement.children;
				if(doc.dataset.state==0){
					lis[0].children[2].children[0].style.marginTop="0px";
					lis[1].style.display="block";
					doc.dataset.state=1;
				}else{
					lis[0].children[2].children[0].style.marginTop="-6px";
					lis[1].style.display="none";
					doc.dataset.state=0;
				}
			}
			//二级标签选择
			function spread(doc,c){
				var dcolor = "rgb(0,113,194,.9)";//二级标签被选中的颜色
				if(doc.style.backgroundColor!=""){
					return;
				}
				var docs = document.getElementsByClassName("navigation-dl-dd");
				for(var i = 0;i<docs.length;i++){
					docs[i].style.backgroundColor="";
				}
				doc.style.backgroundColor=dcolor;
				choose(c);
			}
			//侧标
			function stamp(doc){
				var dtop = doc.offsetTop;
				var sta = document.getElementById("stamp");
				sta.style.height = "55px";
				sta.style.top = dtop+"px";
			}
			function choose(i){
				
				switch(i){
				<c:if test="${!empty   student}">
					case 1:
						document.getElementById("ifr").src="/Smart/views/show.jsp"
						break;
					case 2:
						document.getElementById("ifr").src="/Smart/views/scores.jsp"
						break;
				</c:if>
				<c:if test="${!empty   admin}">
					case 1:
						document.getElementById("ifr").src="/Smart/AdminServlet?method=datashow"
						break;
					case 2:
						document.getElementById("ifr").src="/Smart/views/ManAdmin.jsp"
						break;
					case 3:
						document.getElementById("ifr").src="/Smart/views/getStudentCourse.jsp"
						break;
					case 4:
						document.getElementById("ifr").src="/Smart/views/getStudentMsg.jsp"
						break;
				</c:if>
					
				}
			}
			//时间
			setInterval("time_()",1000)
			function time_(){
				var t = new Date();
				t=t.getFullYear()+"年"+(t.getMonth()+1)+"月"+t.getDate()+"日 "+t.getHours()+":"+t.getMinutes()+":"+t.getSeconds();
				document.getElementById("time_").innerHTML=t
			}
		</script>
	</body>
</html>
