package test0415_hw_4;

import java.sql.*;

public class conn {

	public Connection getCon() {

		String inserturl = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Users";
		String user = "sa";
		String password = "admin";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = (Connection) DriverManager.getConnection(inserturl, user, password);
			System.out.println(conn.getMetaData().getURL()); // ���Գ������ӳɹ�����ʾlog
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
