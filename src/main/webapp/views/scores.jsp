<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="/Smart/CSS/bootstrap.min.css">
<script src="/Smart/JS/jquery.min.js"></script>
<body>
    <h2>
        这是我们找到的关于你的成绩信息：
    </h2>
    <h4><span style="color: #f2dede">红色不及格 </span>
    <span style="color: #fcf8e3">黄色及格 </span>
    <span style="color: #d9edf7">蓝色良好 </span>
    <span style="color: #dff0d8">绿色优秀 </span>
    <!--有3门成绩不足60分。
        公选课类所修的学分为：18分
        创新创业类课程所修的总学分为：12分
        艺术限定类课程所修的总学分为：2分  -->
        
    </h4>
    <h1>
    </h1>
    <table class="table" class="table table-hover">
        <tr class="active">
        	<th>序号</th>
            <th>课程编号</th>
            <th>课程名</th>
            <th>课程类型</th>
            <th>学分</th>
            <th>成绩</th>
            <th>学年</th>
        </tr>
        <c:forEach items="${student.courses}" var="course" varStatus="status">
        	<c:if test="${course.score<60}"><tr class="danger"></c:if>
        	<c:if test="${course.score>=60 && course.score<80}"><tr class="warning"></c:if>
        	<c:if test="${course.score>=80 && course.score<90}"><tr class="info"></c:if>
        	<c:if test="${course.score>89}"><tr class="success"></c:if>
        	
        		<td>${status.count}</td>
        		<td>${course.courseId}</td>
        		<td>${course.courseName}</td>
        		<td>${course.courseType}</td>
        		<td>${course.courseNum}</td>
        		<td>${course.score}</td>
        		<td>${course.courseYear}</td>
        	</tr>
        </c:forEach>
    </table>
</body>
</html>