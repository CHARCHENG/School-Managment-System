<%@ page import="java.util.List" %>
<%@ page import="com.charlie.entity.Course" %><%--
  Created by IntelliJ IDEA.
  User: 18370
  Date: 2021/7/18
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>华明大学教务管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/amazeui.min.js"></script>
    <script type = "text/javascript">
        function addCourse(sno,cno)
        {
            var temp = window.confirm("确定选择这门课吗?");
            if(temp == true)
                window.location.href = 'insertStuCourse?sno=' + sno + '&cno=' + cno;
        }

        function deleteCourse(sno,cno)
        {
            var temp = window.confirm("确定退选这门课吗?");
            if(temp == true)
                window.location.href = 'deleteStuCourse?sno=' + sno + '&cno=' + cno;
        }
    </script>
</head>
<body>

<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="WEB-INF/pages/stuIndex.jsp"><span class="am-icon-home"></span> 首页</a></li>

            <%--            <li class="admin-parent">--%>
            <%--                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 报名申请 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>--%>
            <%--                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">--%>
            <%--                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-puzzle-piece"></span> 重修报名</a></li>--%>
            <%--                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-puzzle-piece"></span> 四六级报名</a></li>--%>
            <%--                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-puzzle-piece"></span> 补考确认</a></li>--%>
            <%--                    <li><a href="admin-user.html" class="am-cf"><span class="am-icon-puzzle-piece"></span> 校外学分替换申请</a></li>--%>
            <%--                </ul>--%>
            <%--            </li>--%>

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
<!-- sidebar end -->


<!-- content start -->
<div class="admin-content">
    <div class="admin-content-body">

        <div class="am-g">
            <div class="am-cf am-padding am-padding-bottom-0"> </div>
            <table class="table table-bordered" style="width:100%; table-layout:fixed">
                <thead>
                <tr>
                    <th></th>
                    <th>星期一</th>
                    <th>星期二</th>
                    <th>星期三</th>
                    <th>星期四</th>
                    <th>星期五</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="i" begin="1" end="6">
                    <tr style="height: 100px">
                        <td>第${i}大节</td>
                        <c:forEach var="j" begin="1" end="5">
                            <c:set scope="page" var="isprint" value="0"/>
                            <c:forEach var = "res" items="${courseMessage}">
                                <c:if test="${res.times.time_id == i && res.weekend == j}">
                                    <c:set scope="page" var="isprint" value="1"/>
                                    <td>
                                        课程名:${res.cname}<br>
                                        教室:${res.classroom}<br>
                                        教师:${res.teacher.tname}<br>
                                        课程性质:${res.csname}
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${isprint == 0}">
                                <td></td>
                            </c:if>
                        </c:forEach>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>
            <div>
                 <small>注:第一大节(8:10-9:40)、 第二大节(10:05-11:35)、第三大节(12:35-14:05)、第四大节(14:35-16:05)、第五大节(17:35-19:05)、第六大节(18:35-20:05)</small>
            </div>
        </div>

    </div>
</div>
</body>
</html>
