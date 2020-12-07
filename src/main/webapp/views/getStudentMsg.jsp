<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="/Smart/CSS/bootstrap.min.css">
    <script src="/Smart/JS/jquery.min.js"></script>
    <style>
        @keyframes myfirst /* Safari and Chrome */
{
	from {opacity: 1}
	to {opacity: 0.25}
}
div{
	animation:myfirst; /* Safari and Chrome */
    animation-iteration-count: infinite;
}
#spinner{
    opacity: 0;
    position: relative;
    width: 0px; 
    z-index: 2000000000; 
    left: 50%; 
    top: 50px;
}
.spinner-fa{
    position: absolute; 
    top: -1px; 
    opacity: 0.25;
    animation-duration: 1.25s;
    
}
.spinner-son{
    position: absolute; 
    width: 8.5px; 
    height: 2.25px; 
    background: rgb(0, 0, 0); 
    box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 1px; 
    transform-origin: left center;
    /* transform: */
    border-radius: 1px;
}
#tip{
    opacity: 0;
}
#stuName{
    color: chocolate;
}
    </style>
</head>
<body>
    <h2>学生信息获取</h2>
    <span>请输入您想要了解的学生姓名：</span>
    <input id="name" type="text" placeholder="StudentName">
    <button id="search">查询</button>
    <h4 id="tip"> 以下是我们找到的，姓名为<span id="stuName">'张三'</span>的学生信息：</h4>
    <!--过度-->
    <div id="spinner" >
        <div class="spinner-fa" style=" ">
            <div  class="spinner-son" style=" transform: rotate(0deg) translate(5px, 0px); ">
            </div>
        </div>
        <div class="spinner-fa" style="animation-delay: 100ms; ">
            <div  class="spinner-son" style=" transform: rotate(27deg) translate(5px, 0px); ">
            </div>
        </div>
        <div class="spinner-fa" style=" animation-delay: 200ms;">
            <div  class="spinner-son" style=" transform: rotate(55deg) translate(5px, 0px); ">
            </div>
        </div>
        <div class="spinner-fa" style=" animation-delay: 300ms;">
            <div  class="spinner-son" style=" transform: rotate(83deg) translate(5px, 0px); ">
            </div>
        </div>
        
        <div class="spinner-fa" style=" animation-delay: 400ms;">
            <div  class="spinner-son" style=" transform: rotate(110deg) translate(5px, 0px); ">
            </div>
        </div>
        <div class="spinner-fa" style=" animation-delay: 500ms;">
            <div  class="spinner-son" style=" transform: rotate(138deg) translate(5px, 0px); ">
            </div>
        </div>
        <div class="spinner-fa" style=" animation-delay: 600ms;">
                <div  class="spinner-son" style=" transform: rotate(166deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 700ms;">
                <div  class="spinner-son" style=" transform: rotate(193deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 800ms;">
                <div  class="spinner-son" style=" transform: rotate(221deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 900ms;">
                <div  class="spinner-son" style=" transform: rotate(249deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 1000ms;">
                <div  class="spinner-son" style=" transform: rotate(276deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 1100ms;">
                <div  class="spinner-son" style=" transform: rotate(304deg) translate(5px, 0px); ">
                </div>
            </div>
            <div class="spinner-fa" style=" animation-delay: 1200ms;">
                    <div  class="spinner-son" style=" transform: rotate(332deg) translate(5px, 0px); ">
                    </div>
                </div>
            </div>
    <!--过度-->
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
            <td id="ksh">00000000000000</td>
            <td id="xh">00000000000</td>
            <td id="xm">xxx</td>
            <td id="xb">x</td>
            <td id="csrq">xxxxxxxx</td>
            <td id="sfzh">xxxxxxxxxxxxxxxxxx</td>
            <td id="zzmm">xx</td>
            <td id="mz">xx</td>
            <td id="zymc">xxxxxxxxxxx</td>
            <td id="bj">xxxxxxxxxxx</td>
            <td id="jg">xxxx</td>
        </tr>
    </table>
    <script>
        $(document).ready(function(){

            $("#search").click(function(){
                $("#spinner").css("opacity",1)
                $("#table").css("opacity",0.2)
                $.ajax({
                    type:"POST",
                    url:"http://localhost:8080/Smart/AdminServlet?method=queryStudent",
                    dataType:"json",
                    data:{
                        name:$("#name").val(),
                    },
                    success:function(student){
                        $("#spinner").css("opacity",0)
                        $("#table").css("opacity",1)
                        $("#tip").css("opacity",1)
                        if(student!=null){
                            $("#ksh").text(student.ksh)
                            $("#xh").text(student.xh)
                            $("#xm").text(student.xm)
                            $("#xb").text(student.xb)
                            $("#csrq").text(student.csrq)
                            $("#sfzh").text(student.sfzh)
                            $("#zzmm").text(student.zzmm)
                            $("#mz").text(student.mz)
                            $("#zymc").text(student.zymc)
                            $("#bj").text(student.bj)
                            $("#jg").text(student.jg)
                            $("#stuName").text("'"+student.xm+"'")
                        }else{
                            $("#tip").text("我们没有找到任何关于'"+$("#name").val()+"'的信息")
                        }
                        // if(data.success){
                        //     $("#createResult").html(data.msg);
                        // }else{
                        //     $("#createResult").html("出现错误"+data.msg);
                        // }
                    }
                    // error:function(jqXHR){
                    //     console.log("发生错误："+jqXHR.status);
                    // }
                })
            })
        });
    </script>
</body>
</html>