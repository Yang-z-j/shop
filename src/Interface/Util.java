package Interface;

import java.sql.*;

public class Util {
//	�����������ݿ����Ϣ�������ݿ�URL���û���������
	private static final String url = "jdbc:mysql://localhost:3306/shop?characterEncoding=utf-8";
	private static final String user = "root";
	private static final String password = "zxcvbnm";

//	 ����JDBC��ض���
	protected static Statement s = null;
	protected static Connection con = null;
	protected static PreparedStatement ps = null;
	protected static ResultSet rs = null;

	/*
	 * �������ݿ�����
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
	 * ִ��INSERT/UPDATE/DELETE SQL���
	 * @param sql SQL��䣬�ַ�������
	 * @return ִ�н����int����
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
	 * ִ��SELECT SQL���
	 * @param sql SQL��䣬�ַ�������
	 * @return ResultSet�����
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
	 * ִ�ж�̬SQL���
	 * @param sql ���в����Ķ�̬SQL��䡣
	 * @return ����PreparedStatement����
	 */
	public static PreparedStatement executePreparedStatement(String sql) {
		try {
			ps = getConnection().prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ps;
	}

//	����ع�
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

//	�ر����ݿ����Ӷ���
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
