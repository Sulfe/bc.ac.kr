package schedule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class scheduleDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public scheduleDAO() {
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

	public schedule getMon(int userID) {
		schedule sc = new schedule();
		String sql = "SELECT time1, time2, time3, time4, time5, time6, time7, time8, time9 FROM usersubject AS us, subtimes AS su WHERE us.userID=? AND us.subCode = su.subCode and dayNum=1;";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sc.setTime1(rs.getString(1));
				sc.setTime2(rs.getString(2));
				sc.setTime3(rs.getString(3));
				sc.setTime4(rs.getString(4));
				sc.setTime5(rs.getString(5));
				sc.setTime6(rs.getString(6));
				sc.setTime7(rs.getString(7));
				sc.setTime8(rs.getString(8));
				sc.setTime9(rs.getString(9));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}

	public schedule gettue(int userID) {
		schedule sc = new schedule();
		String sql = "SELECT time1, time2, time3, time4, time5, time6, time7, time8, time9 FROM usersubject AS us, subtimes AS su WHERE us.userID=? AND us.subCode = su.subCode and dayNum=2;";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sc.setTime1(rs.getString(1));
				sc.setTime2(rs.getString(2));
				sc.setTime3(rs.getString(3));
				sc.setTime4(rs.getString(4));
				sc.setTime5(rs.getString(5));
				sc.setTime6(rs.getString(6));
				sc.setTime7(rs.getString(7));
				sc.setTime8(rs.getString(8));
				sc.setTime9(rs.getString(9));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}
	
	public schedule getwed(int userID) {
		schedule sc = new schedule();
		String sql = "SELECT time1, time2, time3, time4, time5, time6, time7, time8, time9 FROM usersubject AS us, subtimes AS su WHERE us.userID=? AND us.subCode = su.subCode and dayNum=3;";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sc.setTime1(rs.getString(1));
				sc.setTime2(rs.getString(2));
				sc.setTime3(rs.getString(3));
				sc.setTime4(rs.getString(4));
				sc.setTime5(rs.getString(5));
				sc.setTime6(rs.getString(6));
				sc.setTime7(rs.getString(7));
				sc.setTime8(rs.getString(8));
				sc.setTime9(rs.getString(9));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}
	
	public schedule getthu(int userID) {
		schedule sc = new schedule();
		String sql = "SELECT time1, time2, time3, time4, time5, time6, time7, time8, time9 FROM usersubject AS us, subtimes AS su WHERE us.userID=? AND us.subCode = su.subCode and dayNum=4;";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sc.setTime1(rs.getString(1));
				sc.setTime2(rs.getString(2));
				sc.setTime3(rs.getString(3));
				sc.setTime4(rs.getString(4));
				sc.setTime5(rs.getString(5));
				sc.setTime6(rs.getString(6));
				sc.setTime7(rs.getString(7));
				sc.setTime8(rs.getString(8));
				sc.setTime9(rs.getString(9));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}
	
	public schedule getfir(int userID) {
		schedule sc = new schedule();
		String sql = "SELECT time1, time2, time3, time4, time5, time6, time7, time8, time9 FROM usersubject AS us, subtimes AS su WHERE us.userID=? AND us.subCode = su.subCode and dayNum=5;";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sc.setTime1(rs.getString(1));
				sc.setTime2(rs.getString(2));
				sc.setTime3(rs.getString(3));
				sc.setTime4(rs.getString(4));
				sc.setTime5(rs.getString(5));
				sc.setTime6(rs.getString(6));
				sc.setTime7(rs.getString(7));
				sc.setTime8(rs.getString(8));
				sc.setTime9(rs.getString(9));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}
	
}
