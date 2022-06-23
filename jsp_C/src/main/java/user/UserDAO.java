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

            //�����ͺ��̽� �ּ�

            String dbID = "root";    //�����ͺ��̽� ���̵�

            String dbPassword = "root";    //�����ͺ��̽� ��й�ȣ

            Class.forName("com.mysql.jdbc.Driver");    // mysql�� �����ϴ� �Ű�ü���� 

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

        }catch(Exception e) {

            e.printStackTrace(); //�����߻��� �������� ����ϰ� ���ִ� �ҽ�

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

                    return 1; // �α��� ����

                } else 

                    return 0; // ��й�ȣ ����ġ

            }

            return -1; //���̵� ����

        }catch(Exception e) {

            e.printStackTrace();    // ����ó��

        }

        return -2; // �����ͺ��̽� ����

    }
	
    
}


