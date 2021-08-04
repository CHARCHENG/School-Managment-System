<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 18370
  Date: 2021/7/22
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>华明大学教务管理系统</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/amazeui.min.js"></script>
    <script type="text/javascript" src="assets/js/app.js"></script>
</head>

<body>

<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="WEB-INF/pages/stuIndex.jsp"><span class="am-icon-home"></span> 首页</a></li>

            <li>
                <!-- data-am-collapse中的target对应ul的id -->
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav-2'}"><span class="am-icon-file"></span> 教学管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-2">
                    <li><a href="getStuSelectMessage" class="am-cf"><span class="am-icon-puzzle-piece"></span> 教学班教材信息录入</a></li>
                    <li><a href="getAllCourse" class="am-cf"><span class="am-icon-puzzle-piece"></span> 教学计划录入</a></li>
                    <li><a href="getStuSelectMessage" class="am-cf"><span class="am-icon-puzzle-piece"></span> 教学班考试信息录入 </a></li>
                    <li><a href="getCourseStudents" class="am-cf"><span class="am-icon-puzzle-piece"></span> 学生成绩录入 </a></li>
                </ul>
            </li>

            <li>
                <!-- data-am-collapse中的target对应ul的id -->
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav-3'}"><span class="am-icon-file"></span> 信息查询 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-3">
                    <li><a href="getAllSelectedCourseGrade" class="am-cf"><span class="am-icon-puzzle-piece"></span> 学生成绩查询</a></li>
                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-puzzle-piece"></span> 考试信息查询</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong style="color: brown;">学生选课(跨学期)</strong> / <small>你好！${teacher.tname}老师 !</small> </div>
        </div>

        <div class="am-g">
            <div class="am-cf am-padding am-padding-bottom-0"> </div>
                <table class="table table-bordered" style="width:100%; table-layout:fixed">
                    <thead>
                    <tr>
                        <td>课程号</td>
                        <td>课程名</td>
                        <td>课程性质</td>
                        <td>学分</td>
                        <td>上课地点</td>
                        <td>星期</td>
                        <td>上课时间</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                            <td>${course.cno}</td>
                            <td>${course.cname}</td>
                            <td>${course.csname}</td>
                            <td>${course.cscore}</td>
                            <td>${course.classroom}</td>
                            <td>${course.weekend}</td>
                            <td>${course.times.timeName}</td>
                            <td> <button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" onclick="window.location.href='getCourseStudents'">单击录入成绩</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>

</html>
