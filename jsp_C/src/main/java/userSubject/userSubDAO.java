package userSubject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




public class userSubDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public userSubDAO() {

		try {

			String dbURL = "jdbc:mysql://localhost:3306/jsp";

			// 데이터베이스 주소

			String dbID = "root"; // 데이터베이스 아이디

			String dbPassword = "root"; // 데이터베이스 비밀번호

			Class.forName("com.mysql.jdbc.Driver"); // mysql에 접속하는 매개체역할

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // 오류발생시 오류내용 출력하게 해주는 소스

		}

	}

	public int writeSub(int userID, String[] sub) {

		try {

			for (int i = 0; i < sub.length; i++) {

				String SQL = "INSERT INTO userSubject VALUES(?,?)";

				pstmt = conn.prepareStatement(SQL);

				pstmt.setInt(1, userID);

				pstmt.setString(2, sub[i]);

				pstmt.executeUpdate();

			}

			return 1;

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1;
	}

	public int delSub(int userID) {
		String SQL = "DELETE FROM usersubject WHERE userID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);

			return pstmt.executeUpdate();
		} catch (

		Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터 오류발생 시

	}

	public userSub getSub(int userID) {
		userSub us = new userSub();
		String sql = "SELECT GROUP_CONCAT(subName SEPARATOR ' | ') FROM usersubject AS us,SUBJECT AS sub WHERE userID = ? AND us.subCode = sub.subCode";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				us.setSubName(rs.getString(1));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return us;
	}

	
}
