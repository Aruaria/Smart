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
    <!-- 引入 ECharts 文件 -->
    <script src="/Smart/JS/echarts.min.js"></script>
    <style>
        div{
            float: left;
        }
    </style>
</head>
<body>
    <h2>数据分析</h2>
    <h3>本系统统计了${allSum }个学生信息，${courseSum }门成绩信息，分析后得到以下结果：</h3>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="bujige" style="width: 1000px;height:400px;"></div>
    <div id="bubanji" style="width: 600px;height:400px;"></div>
    <div id="student" style="width: 600px;height:400px;"></div>
    <div id="project" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var bujige = echarts.init(document.getElementById('bujige'));
        var bubanji = echarts.init(document.getElementById('bubanji'));
        var student = echarts.init(document.getElementById('student'));
        var project = echarts.init(document.getElementById('project'));
        // 指定图表的配置项和数据
        var bujiges = {
            title: {
                text: '不及格人数'
            },
            tooltip: {},
            legend: {
                data:['人数']
            },
            xAxis: {
                data: [
                	<%--
                	<c:forEach items="${falseCourses}" var="course" varStatus="coStatus">
                	"${course}"
                	<c:if test="${coStatus<6}">
                	,
                </c:if>
                	</c:forEach>
                	--%>
                	"Web前端","军事理论（线上）","职业生涯提升（线上）","创业人生（线上）","篮球2","九型人格之职场心理（线上）"
                	]
            },
            yAxis: {},
            series: [{
                name: '人数',
                type: 'bar',
                data: [24, 23, 21, 19, 17, 16]
            }]
        };

        var bubanjis = {
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: [
                    	<c:forEach items="${falseclasses}" var="cla" varStatus="coStatus">
                    	"${cla}"
                    	<c:if test="${coStatus.count<6}">
                    	,
                    </c:if>
                    	</c:forEach>
                    	],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '不及格人数',
                    type: 'bar',
                    barWidth: '60%',
                    data: [25, 22, 22, 17, 17, 15]
                }
            ]
        };
        var students = {
    backgroundColor: '#2c343c',

    title: {
        text: '挂科占比',
        left: 'center',
        top: 20,
        textStyle: {
            color: '#ccc'
        }
    },

    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
    },

    visualMap: {
        show: false,
        min: 80,
        max: 600,
        inRange: {
            colorLightness: [0, 1]
        }
    },
    series: [
        {
            name: '访问来源',
            type: 'pie',
            radius: '55%',
            center: ['50%', '50%'],
            data: [
                {value: ${allSum-falseSum}, name: '合格'},
                {value: ${falseSum}, name: '挂科'},
                // {value: 274, name: '联盟广告'},
                // {value: 235, name: '视频广告'},
                // {value: 400, name: '搜索引擎'}
            ].sort(function (a, b) { return a.value - b.value; }),
            roseType: 'radius',
            label: {
                color: 'rgba(255, 255, 255, 0.3)'
            },
            labelLine: {
                lineStyle: {
                    color: 'rgba(255, 255, 255, 0.3)'
                },
                smooth: 0.2,
                length: 10,
                length2: 20
            },
            itemStyle: {
                color: '#c23531',
                shadowBlur: 200,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            },

            animationType: 'scale',
            animationEasing: 'elasticOut',
            animationDelay: function (idx) {
                return Math.random() * 200;
            }
        }
    ]
};
        // 使用刚指定的配置项和数据显示图表。
        bujige.setOption(bujiges);
        bubanji.setOption(bubanjis)
        student.setOption(students)
    </script>
</body>
</html>