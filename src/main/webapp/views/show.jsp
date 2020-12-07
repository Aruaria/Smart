<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>成绩</title>
    
</head>
<link rel="stylesheet" type="text/css" href="/Smart/CSS/bootstrap.min.css">
<script src="/Smart/JS/jquery.min.js"></script>
<style>
    h2{
        font-family: 宋体;
    }
    table{
        opacity: 0;
        transition: opacity 2s;
    }
</style>
<body>
    <h1 id="hai"></h1>
    <h2 id="zhe"></h2>
    <table id="table"  class="table table-hover">
        <tr>
            <th>考生号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>出生日期</th>
            <th>身份证号</th>
            <th>政治面貌</th>
            <th>民族</th>
            <th>专业名称</th>
            <th>班级</th>
            <th>籍贯</th>
        </tr>
        <tr>
            <td>${student.ksh}</td>
            <td>${student.xh}</td>
            <td>${student.xm}</td>
            <td>${student.xb}</td>
            <td>${student.csrq}</td>
            <td>${student.sfzh}</td>
            <td>${student.zzmm}</td>
            <td>${student.mz}</td>
            <td>${student.zymc}</td>
            <td>${student.bj}</td>
            <td>${student.jg}</td>
        </tr>
    </table>
    <script>
        show();
      var i = 0;
      var j = 0;
       function show(){  
        var content = "嗨，别来无恙啊！";
        // $("#hai").text("test")
              var str  = content.substring(0,i)
               $("#hai").text(str + "")
               // txt.innerHTML = str + "_"; 
               i++; 
               if (i>content.length){
                   show2();
               }; 
               setTimeout("show()",200);
            }
        function show2(){  
        var content = "这是我们从教务系统找到的关于你的资料：";
        // $("#hai").text("test")
              var str  = content.substring(0,j)
               $("#zhe").text(str + "")
               // txt.innerHTML = str + "_"; 
               j++; 
            //    if (i>content.length)i=0; 
            if (j>content.length){
                   $("#table").css("opacity","1")
               }; 
               setTimeout("show2()",600);

            }

   </script>
</body>
</html>