package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() { 

        try {

            String dbURL ="jdbc:mysql://localhost:3306/jsp";

            //데이터베이스 주소

            String dbID = "root";    //데이터베이스 아이디

            String dbPassword = "root";    //데이터베이스 비밀번호

            Class.forName("com.mysql.jdbc.Driver");    // mysql에 접속하는 매개체역할 

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

        }catch(Exception e) {

            e.printStackTrace(); //오류발생시 오류내용 출력하게 해주는 소스

        }

    }
	
	public User getMember(int userID){
		User us =  new User();
		
		try{

		String sql = "select * from user where userID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userID);
		
		rs = pstmt.executeQuery();

			if(rs.next()){
				us.setUserNum(rs.getInt("userNum"));
				us.setUserName(rs.getString("userName"));
				us.setUserDep(rs.getString("userDep"));
				us.setUserMajor(rs.getString("userMajor"));
				us.setUserYear(rs.getString("userYear"));
				us.setUserLevel(rs.getString("userLevel"));
				us.setUserEng(rs.getString("userEng"));
				us.setUserCredit(rs.getString("userCredit"));
				

			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return us;
	}
	
	
	
	
    public int login(int userID, String userPassword) {

        String SQL = "Select userPassword From USER where userID = ?";

        try {

            pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, userID);

            rs = pstmt.executeQuery();

            if(rs.next()) {

                if(rs.getString(1).equals(userPassword)) {

                    return 1; // 로그인 성공

                } else 

                    return 0; // 비밀번호 불일치

            }

            return -1; //아이디가 없음

        }catch(Exception e) {

            e.printStackTrace();    // 예외처리

        }

        return -2; // 데이터베이스 오류

    }
	
    
}


