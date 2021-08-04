<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 18370
  Date: 2021/7/22
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <div class="am-fl am-cf"><strong style="color: brown;">成绩填写</strong> </div>
        </div>

        <div class="am-g">
                <form:form action="updateStuGrade" method="post">
                    <div class="row" style="text-align:center">
                        <div class="col-lg-3">平时成绩(%)</div>
                        <div class="col-lg-3">实验成绩(%)</div>
                        <div class="col-lg-3">期中成绩(%)</div>
                        <div class="col-lg-3">期末成绩(%)</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3"><input type="text" name = "dailyPerformancePercentage" class="form-control" placeholder="请输入平时成绩占总成绩比"></div>
                        <div class="col-lg-3"><input type="text" name = "experimentPerformancePercentage" class="form-control" placeholder="请输入实验成绩占总成绩比"></div>
                        <div class="col-lg-3"><input type="text" name = "midtermPerfoemancePercentage" class="form-control" placeholder="请输入期中成绩占总成绩比"></div>
                        <div class="col-lg-3"><input type="text" name = "finalexamPerformancePercentage" class="form-control" placeholder="请输入期末成绩占总成绩比"></div>
                    </div>
                    <table class="table">
                            <thead>
                                 <tr>
                                     <td>学号</td>
                                     <td>姓名</td>
                                     <td>性别</td>
                                     <td>入学年份</td>
                                     <td>班级</td>
                                     <td>专业</td>
                                     <td>所在学院</td>
                                     <td>平时成绩</td>
                                     <td>实验成绩</td>
                                     <td>期中成绩</td>
                                     <td>期末成绩</td>
                                 </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="stu" items="${stuMessages}">
                                    <tr>
                                        <td>${stu.sno}</td>
                                        <td>${stu.sname}</td>
                                        <td>${stu.ssex}</td>
                                        <td>${stu.years}</td>
                                        <td>${stu.classes.className}</td>
                                        <td>${stu.classes.major.mname}</td>
                                        <td>${stu.classes.major.department.departName}</td>
                                        <td width="5%"><input type="text" name = "dailyPerformance" class="form-control"></td>
                                        <td width="5%"><input type="text" name = "experimentPerformance" class="form-control"></td>
                                        <td width="5%"><input type="text" name = "midtermPerfoemance" class="form-control"></td>
                                        <td width="5%"><input type="text" name = "finalexamPerformance" class="form-control"></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
                    <div class="row" ><div class="col-lg-12"><input type="submit" class="btn btn-default" style="width: 300px;margin-left: 35%"></div></div>
                    <div> </div>
                </form:form>
        </div>
     </div>
  </div>
</body>

</html>
