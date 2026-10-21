<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="header">
    <div class="system-title">📚 学生选课系统</div>
    <div class="user-info">
        <span class="username">欢迎，${user.username}</span>
        <span class="user-type">${user.type}</span>
        <form action="<%=request.getContextPath()%>/logout" method="post" style="display:inline;">
            <button type="submit" class="logout-btn">退出系统</button>
        </form>
    </div>
</div>
