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

			// �����ͺ��̽� �ּ�

			String dbID = "root"; // �����ͺ��̽� ���̵�

			String dbPassword = "root"; // �����ͺ��̽� ��й�ȣ

			Class.forName("com.mysql.jdbc.Driver"); // mysql�� �����ϴ� �Ű�ü����

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // �����߻��� �������� ����ϰ� ���ִ� �ҽ�

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

		return -1; // ������ �����߻� ��

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
