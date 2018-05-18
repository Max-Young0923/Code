package test0415_hw_4;

import java.sql.*;

public class userService {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public userService() {
		conn = new test0415_hw_4.conn().getCon();
	}

	public boolean valiUser(userTable user) {
		try {
			pstmt = conn.prepareStatement("select * from account where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			ResultSet re = pstmt.executeQuery();
			if (re.next()) //如果结果集里有数据，说明验证正确，否则失败  
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
