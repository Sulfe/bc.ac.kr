package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class boardDAO {

	private Connection conn;
	private ResultSet rs;

	public boardDAO() {
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

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL); // ����Ǿ� �ִ� ��ü�� �̿��ؼ� �����غ�ܰ�� ����� ��

			rs = pstmt.executeQuery(); // ����� ����� ���������� ����

			if (rs.next()) {

				return rs.getString(1); // ���°��� ��ȯ�� �ֵ��� ����

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return ""; // ������ ���̽� ���� �˸�

	}

	public int getNext() {
		String SQL = "SELECT bdNum FROM board ORDER BY bdNum DESC"; // bbsID�� ���� ����(+1)�ϱ� ����, ���� ������ bbsID�� ������

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL); // ����Ǿ� �ִ� ��ü�� �̿��ؼ� �����غ�ܰ�� ����� ��

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1; // ���°��� 1�� ���༭ ���ο� bbsID���� ��ȯ

			}

			return 1; // ���������Ͱ� ���� ù��° �Խù��ΰ��

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // ������ �����߻� ��
	}

	public int write(String bdTitle, String bdContent, int userID, String bdTask, String bdMeeting, String bdWay,
			String bdTest, String bdCredit, String bdScore, String bdTerm) {
		String SQL = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext());
			pstmt.setString(2, bdTitle);
			pstmt.setString(3, bdContent);
			pstmt.setInt(4, userID);
			pstmt.setString(5, getDate());
			pstmt.setString(6, bdTask);
			pstmt.setString(7, bdMeeting);
			pstmt.setString(8, bdWay);
			pstmt.setString(9, bdTest);
			pstmt.setString(10, bdCredit);
			pstmt.setString(11, bdScore);
			pstmt.setString(12, bdTerm);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // ������ �����߻� ��

	}

	public ArrayList<board> getList(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE bdNum <? ORDER BY bdNum DESC LIMIT 10";
		ArrayList<board> list = new ArrayList<board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board board = new board();
				board.setBdNum(rs.getInt(1));
				board.setBdTitle(rs.getString(2));
				board.setBdContent(rs.getString(3));
				board.setUserID(rs.getInt(4));
				board.setBdDate(rs.getString(5));
				board.setBdTask(rs.getString(6));
				board.setBdMeeting(rs.getString(7));
				board.setBdWay(rs.getString(8));
				board.setBdTest(rs.getString(9));
				board.setBdCredit(rs.getString(10));
				board.setBdScore(rs.getString(11));
				board.setBdTerm(rs.getString(12));

				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board WHERE bdNum <?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public board getContent(int bdNum) {
		String SQL = "SELECT * FROM board WHERE bdNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bdNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board board = new board();
				board.setBdNum(rs.getInt(1));
				board.setBdTitle(rs.getString(2));
				board.setBdContent(rs.getString(3));
				board.setUserID(rs.getInt(4));
				board.setBdDate(rs.getString(5));
				board.setBdTask(rs.getString(6));
				board.setBdMeeting(rs.getString(7));
				board.setBdWay(rs.getString(8));
				board.setBdTest(rs.getString(9));
				board.setBdCredit(rs.getString(10));
				board.setBdScore(rs.getString(11));
				board.setBdTerm(rs.getString(12));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
