package subinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.board;
import schedule.schedule;

public class subinfoDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public subinfoDAO() {
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

	public ArrayList<subinfo> getList(int userID) {
		String SQL = "SELECT s.subCode, s.subName, s.subGrade, s.subPeople, s.subPro, s.subTime, s.subWhere FROM subject AS s, usersubject AS u WHERE u.subCode = s.subCode AND u.userID=?";
		ArrayList<subinfo> list = new ArrayList<subinfo>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				subinfo sf = new subinfo();
				sf.setSubCode(rs.getInt(1));
				sf.setSubName(rs.getString(2));
				sf.setSubGrade(rs.getString(3));
				sf.setSubPeople(rs.getString(4));
				sf.setSubPro(rs.getString(5));
				sf.setSubTime(rs.getString(6));
				sf.setSubWhere(rs.getString(7));

				list.add(sf);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public subinfo getSum(int userID) {
		subinfo sin = new subinfo();
		String SQL = "SELECT SUM(su.subGrade) FROM subject as su, usersubject as us WHERE su.subCode=us.subCode and us.userID=?";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sin.setSubSum(rs.getInt(1));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sin;
	}

}
