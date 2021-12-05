package Interface;

import java.sql.*;

public class Util {
//	声明连接数据库的信息，如数据库URL、用户名及密码
	private static final String url = "jdbc:mysql://localhost:3306/shop?characterEncoding=utf-8";
	private static final String user = "root";
	private static final String password = "zxcvbnm";

//	 声明JDBC相关对象
	protected static Statement s = null;
	protected static Connection con = null;
	protected static PreparedStatement ps = null;
	protected static ResultSet rs = null;

	/*
	 * 创建数据库连接
	 * @return conn
	 */
	public static synchronized Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	/*
	 * 执行INSERT/UPDATE/DELETE SQL语句
	 * @param sql SQL语句，字符串类型
	 * @return 执行结果，int类型
	 */
	public static int executeUpdate(String sql) {
		int result = 0;
		try {
			s = getConnection().createStatement();
			result = s.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/*
	 * 执行SELECT SQL语句
	 * @param sql SQL语句，字符串类型
	 * @return ResultSet结果集
	 */
	public static ResultSet executeQuery(PreparedStatement ps) {

		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	/*
	 * 执行动态SQL语句
	 * @param sql 含有参数的动态SQL语句。
	 * @return 返回PreparedStatement对象
	 */
	public static PreparedStatement executePreparedStatement(String sql) {
		try {
			ps = getConnection().prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ps;
	}

//	事务回滚
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

//	关闭数据库连接对象
	public static void close() {
		try {
			if (rs != null)
				rs.close();
			if (s != null)
				s.close();
			if (con != null)
				con.close();
			if (ps != null)
				ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
