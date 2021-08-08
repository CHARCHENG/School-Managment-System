<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <script type="text/javascript">
    function lookList(cno){
      window.location.href = 'getStudentList?cno=' + cno;
    }

    function submitMessage(cno) {
      var temp = window.confirm("确定提交考试信息吗?");
      if(temp == true) {
         var testClassroom = document.getElementById("testClassroom").value;
         var testTimes = document.getElementById("testTimes").value
         var param = "cno=" + cno + "&testClassroom=" + testClassroom + "&testTimes=" + testTimes;
         window.location.href = 'updateCourseTestMessage?'+param;
      }
    }
  </script>
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
          <li><a href="inputCourseTestMessage" class="am-cf"><span class="am-icon-puzzle-piece"></span> 教学班考试信息录入 </a></li>
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
            <td>
              <c:choose>
                <c:when test="${course.indexs == 1}">
                  <p>信息已录入</p>
                </c:when>
                <c:when test="${course.indexs == 0}">
                  <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                     录入课程考试信息
                  </button>
              <!-- Modal -->
                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                 <div class="modal-header">
                                      <h4 class="modal-title" id="myModalLabel"> 请输入课程考试信息 </h4>
                                 </div>

                            <div class="modal-body">
                                <input type="hidden" name = "cno" value = "${course.cno}">
                                <p>考试教室:<input type="text" id= "testClassroom" class="form-control" placeholder="请输入考试教室(实例:A教101)"></p>
                                <p>考试时间:<input type="text" id = "testTimes" class="form-control" placeholder="请输入考试具体时间(实例:13:00~15:00)"></p>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" onclick="submitMessage('${course.cno}')">提交</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>

                          </div>
                        </div>
                  </div>
                </c:when>
              </c:choose>
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
