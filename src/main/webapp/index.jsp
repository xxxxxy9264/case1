<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生选课系统 - 登录</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="icon">📚</div>
            <h2>学生选课系统</h2>
            <p>请使用您的账号登录</p>
        </div>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <div class="form-group">
                <label>用户名</label>
                <input name="username" type="text" placeholder="请输入学号 / 用户名" required>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input name="password" type="password" placeholder="请输入密码" required>
            </div>
            <div class="btn-group">
                <input type="reset" value="重置" class="btn btn-reset">
                <input type="submit" value="登录" class="btn btn-submit">
            </div>
            <div class="error-msg">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </div>
        </form>
    </div>
</body>
</html>