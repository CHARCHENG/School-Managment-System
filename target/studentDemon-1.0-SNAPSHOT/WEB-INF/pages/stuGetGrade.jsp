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
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav-2'}"><span class="am-icon-file"></span> 选课 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav-2">
                    <li><a href="getStuSelectMessage" class="am-cf"><span class="am-icon-puzzle-piece"></span> 学生课表查询</a></li>
                    <li><a href="getAllCourse" class="am-cf"><span class="am-icon-puzzle-piece"></span> 学生选课(跨学期)</a></li>
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
            <div class="am-fl am-cf"><strong style="color: brown;">学生选课(跨学期)</strong> / <small>你好！${stuinfo.sname}同学 !</small> </div>
        </div>

        <div class="am-g">
            <table class="am-table am-table-striped am-table-hover table-main">
                <thead>
                <tr>
                    <th>课程名</th>
                    <th>任课教师</th>
                    <th>教师职称</th>
                    <th>授课教室</th>
                    <th>开课学院</th>
                    <th>开课学期</th>
                    <th>课程性质</th>
                    <th>课程学分</th>
                    <th>最终成绩</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var = "stuGrade" items="${stuGrades}" >
                    <tr>
                        <td>${stuGrade.get("cname")}</td>
                        <td>${stuGrade.get("tname")}</td>
                        <td>${stuGrade.get("title")}</td>
                        <td>${stuGrade.get("classroom")}</td>
                        <td>${stuGrade.get("departName")}</td>
                        <td>第${stuGrade.get("term")}学期</td>
                        <td>${stuGrade.get("csname")}</td>
                        <td>${stuGrade.get("cscore")}</td>
                        <td>${stuGrade.get("finalGrade")}</td>
                        <td>
                            <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                                单击查看成绩详情
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel"> 详细成绩占比请咨询${stuGrade.get("tname")}老师 </h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>平时成绩:${stuGrade.get("dailyPerformance")}</p>
                                            <p>实验成绩:${stuGrade.get("experimentPerformance")}</p>
                                            <p>期中成绩:${stuGrade.get("midtermPerfoemance")}</p>
                                            <p>期末成绩:${stuGrade.get("finalexamPerformance")}</p>
                                            <p>最终成绩:${stuGrade.get("finalGrade")}</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
  </div>
</body>

</html>
