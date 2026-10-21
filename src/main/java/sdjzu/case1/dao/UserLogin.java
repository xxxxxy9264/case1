package sdjzu.case1.dao;

import sdjzu.case1.entity.User;
import sdjzu.case1.util.DBConnection;

import java.sql.*;

public class UserLogin {
	public static boolean validlogin1(String username, String password)throws SQLException{
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			// 2、获得连接对象
			conn = DBConnection.getConnection();
			// 定义sql语句
			String sql = "select * from user where username='"+username+"' and password='"+password+"'";
			// 3、创建语句对象
			st = conn.createStatement();
			// 4、遍历结果集（此处不需要）
			rs=st.executeQuery(sql);
			if(rs.next()) successflag=true;
		} finally {
			// 5、关闭资源对象
			DBConnection.close(rs, st, conn);
		}
		return successflag;
	}
	public static User validlogin(String username, String password)throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			// 2、获得连接对象
			conn = DBConnection.getConnection();
			// 定义sql语句
			String sql = "select * from user where username=? and password=?";
			// 3、创建语句对象
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			// 4、执行查询
			rs=ps.executeQuery();
			// 5、处理查询结果
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
			}
		} finally {
			// 5、关闭资源对象
			DBConnection.close(rs, ps, conn);
		}
		return user;
	}

}
