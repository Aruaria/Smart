<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="/Smart/CSS/bootstrap.min.css">
    <script src="/Smart/JS/jquery.min.js"></script>
</head>
<body>
    <h3>管理员控制</h3>
    <h4>这是本系统的所有管理员信息,可以在方框中直接修改信息，在最下方进行成员添加</h4>
    <h4 style="color:red">${errorMag }</h4>
    <table class="table table-hover">
        <tr><th>账号</th><th>姓名</th><th>密码</th><th>操作</th></tr>
        	<c:forEach items="${adminlist}" var="adminSolo" varStatus="adStatus">
        	<tr>
            <form method="POST" action="/Smart/AdminServlet?method=updateAdmin">
                <input type="hidden" name="oldId" value="${adminSolo.adminId}">
                <td><input name="adminId" value="${adminSolo.adminId}" 
                <c:if test="${adminSolo.adminName =='超级管理员' }">
                	disabled="disabled"
                </c:if>
                ></td>
                <td><input name="adminName" value="${adminSolo.adminName}"
                <c:if test="${adminSolo.adminName =='超级管理员' }">
                	disabled="disabled"
                </c:if>
                ></td>
                <td><input name="adminPwd" value="${adminSolo.adminPwd}"
                <c:if test="${adminSolo.adminName =='超级管理员' }">
                	disabled="disabled"
                </c:if>
                ></td>
                <td>
                <c:if test="${adminSolo.adminName =='超级管理员' }">
                	超管信息不可修改
                </c:if>
                <c:if test="${adminSolo.adminName !='超级管理员' }">
                	<input type="submit" value="确认修改"><button><a href="/Smart/AdminServlet?method=deleteAdmin&adminId=${adminSolo.adminId }">删除</a></button>
                </c:if>
                </td>
            </form>
        </tr>
        	</c:forEach>
            
        <tr>
        	<form method="POST" action="/Smart/AdminServlet?method=addAdmin">
            <td><input type="text" name="adminId" placeholder="adminId"></td>
            <td><input type="text" name="adminName" placeholder="adminName"></td>
            <td><input type="text" name="adminPwd" placeholder="adminPwd"></td>
            <td><input type="submit" value="添加新成员"></td>
            </form>
        </tr>
    </table>

</body>
</html>