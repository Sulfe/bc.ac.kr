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

			// 데이터베이스 주소

			String dbID = "root"; // 데이터베이스 아이디

			String dbPassword = "root"; // 데이터베이스 비밀번호

			Class.forName("com.mysql.jdbc.Driver"); // mysql에 접속하는 매개체역할

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // 오류발생시 오류내용 출력하게 해주는 소스

		}

	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL); // 연결되어 있는 객체를 이용해서 실행준비단계로 만들어 줌

			rs = pstmt.executeQuery(); // 실행된 결과를 가져오도록 해줌

			if (rs.next()) {

				return rs.getString(1); // 나온값을 반환해 주도록 해줌

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return ""; // 데이터 베이스 오류 알림

	}

	public int getNext() {
		String SQL = "SELECT bdNum FROM board ORDER BY bdNum DESC"; // bbsID를 새로 생성(+1)하기 위해, 가장 마지막 bbsID를 가져옴

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL); // 연결되어 있는 객체를 이용해서 실행준비단계로 만들어 줌

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1; // 나온값에 1을 해줘서 새로운 bbsID값을 반환

			}

			return 1; // 기존데이터가 없어 첫번째 게시물인경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터 오류발생 시
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

		return -1; // 데이터 오류발생 시

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
