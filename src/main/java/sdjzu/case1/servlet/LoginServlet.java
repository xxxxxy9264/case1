package sdjzu.case1.servlet;

import java.io.IOException;
import java.io.Serial;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;
import sdjzu.case1.dao.UserLogin;
import sdjzu.case1.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = UserLogin.validlogin(username, password);
            if(user == null) throw new Exception("用户名或密码不正确");

            request.getSession().setAttribute("user", user);
            switch (user.getType()) {
                case "学生" -> response.sendRedirect(request.getContextPath()+"/mainPage/Student.jsp");
                case "教师" -> response.sendRedirect(request.getContextPath()+"/mainPage/Teacher.jsp");
                case "管理员" -> response.sendRedirect(request.getContextPath()+"/mainPage/Admin.jsp");
                default -> throw new Exception("用户类型不对，只能为学生、教师或管理员");
            }

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

}
