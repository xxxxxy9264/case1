<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生选课系统 - 管理员主页</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="main-content">
        <!-- 左侧菜单导航 -->
        <div class="sidebar">
            <div class="menu-title">管理员菜单</div>
            <ul class="menu-list">
                <li><a href="#" class="active"><span class="menu-icon">🏠</span> 系统概览</a></li>
                <li><a href="#"><span class="menu-icon">👥</span> 用户管理</a></li>
                <li><a href="#"><span class="menu-icon">📚</span> 课程管理</a></li>
                <li><a href="#"><span class="menu-icon">📅</span> 选课管理</a></li>
                <li><a href="#"><span class="menu-icon">⚙️</span> 系统设置</a></li>
            </ul>
        </div>

        <!-- 右侧内容展示区 -->
        <div class="content-area">
            <div class="content-header">管理员主页</div>
            <div class="welcome-card">
                <h3>欢迎使用学生选课系统</h3>
                <p>管理员 ${user.username}，你好！</p>
                <p>你可以在左侧菜单中进行用户管理、课程管理、选课管理及系统设置等操作。</p>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
