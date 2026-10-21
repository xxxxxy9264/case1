<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生选课系统 - 教师主页</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="main-content">
        <!-- 左侧菜单导航 -->
        <div class="sidebar">
            <div class="menu-title">教师菜单</div>
            <ul class="menu-list">
                <li><a href="#" class="active"><span class="menu-icon">📚</span> 我的课程</a></li>
                <li><a href="#"><span class="menu-icon">👥</span> 学生管理</a></li>
                <li><a href="#"><span class="menu-icon">✏️</span> 成绩录入</a></li>
                <li><a href="#"><span class="menu-icon">📊</span> 成绩统计</a></li>
                <li><a href="#"><span class="menu-icon">👤</span> 个人信息</a></li>
            </ul>
        </div>

        <!-- 右侧内容展示区 -->
        <div class="content-area">
            <div class="content-header">教师主页</div>
            <div class="welcome-card">
                <h3>欢迎使用学生选课系统</h3>
                <p>尊敬的 ${user.username} 老师，你好！</p>
                <p>你可以在左侧菜单中管理课程、录入学生成绩、查看成绩统计等。</p>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
