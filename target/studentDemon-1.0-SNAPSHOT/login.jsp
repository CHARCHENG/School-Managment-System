<%--
  Created by IntelliJ IDEA.
  User: 18370
  Date: 2021/7/15
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" href="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" href="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <title>登录界面</title>
    <style type="text/css">
        .two
        {
            position: absolute;
            width: 600px;
            height: 370px;
            background-color: rgb(255, 255, 255, 0.95);
            border-radius: 8px;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            -moz-box-shadow: 2px 2px 10px #909090;
            -webkit-box-shadow: 2px 2px 10px #909090;
            box-shadow:2px 2px 10px #909090;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body style="background: url(images/bg.png) ; background-size:100% 100% ; background-attachment: fixed">

<div class="two">
    <img src="images/jiaowu.png"  class="center-block" style="width: 430px;height: 150px;">
    <form:form action="login" method="post">
    <table class="table table-bordered" style="text-align: center;">
        <tr>
            <td>
                <div class="input-group">
                    <span class="input-group-addon">学号&nbsp&nbsp&nbsp&nbsp;</span>
                    <input type="text" name = "num" class="form-control" placeholder="请输入学生或教职工学号">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <span class="input-group-addon">密码&nbsp&nbsp&nbsp&nbsp;</span>
                    <input type="password" name="spassword" class="form-control" placeholder="请输入密码">
                </div>
            </td>
        </tr>
        <tr>
            <td >
                <label class="checkbox-inline">
                    <input type="radio" name="identify" value="student" checked> 学生
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="identify" value="teacher"> 教师
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="identify"  value="admin"> 管理员
                </label>
            </td>
        </tr>
    </table>
        <div style="padding-left: 245px;"><input type="submit" class="btn btn-default" style="width: 100px"></div>
    </form:form>
</div>


</body>
