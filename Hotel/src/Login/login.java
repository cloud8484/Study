package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class login {
	public static void main(String[] args) {
		Connection conn = null;
		
		try {
			//Mysql 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) { //구체적으로 드라이버 실패한거 알려줌?
			// TODO: handle exception
			System.out.println("드라이버 로딩 실패");
		}
		System.out.println("드라이버 로딩 성공");
		try {
			// 연결하기
	         String url = "jdbc:mysql://localhost/3306/hotel";
	         conn = DriverManager.getConnection(url + "?serverTimezone=UTC&useSSL=false", "root", "1234");
	         System.out.println("연결 성공");
	      } catch (SQLException e) {
	         System.out.println("서버 연결 실패");
	         e.printStackTrace();
	      }
		
		finally {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("서버 연결 종료 실패(conn)");
			e.printStackTrace();
		}
		System.out.println("서버연결실패");
	   }
	}
}
