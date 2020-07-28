package Login;

import java.sql.*;

public class ClientBean {

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    void connect() {
        try {
            //1. Mysql 드라이버 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("드라이버 로딩 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩 실패");
            e.printStackTrace();
        }
        try {
            //2. 연결하기
             String url = "jdbc:mysql://localhost:/hotel";
             conn = DriverManager.getConnection(url + "?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false", "root", "1234");
             System.out.println("연결 성공");
          } catch (SQLException e) {
             System.out.println("서버 연결 실패");
             e.printStackTrace();
          }
    }
    void disconnect() {
		if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                System.out.println("서버 연결 종료 실패 (pstmt)");
                e.printStackTrace();
            }
        }

        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.out.println("서버 연결 종료 실패 (stmt)");
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("서버 연결 종료 실패(conn)");
                e.printStackTrace();
            }
        }
        System.out.println("서버 연결 종료");
    }
    public String getUserPassword(String client_id) {
        connect();

        String sql = "select client_password from client_info1 where client_id = ?";
        String password = "default";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, client_id);

            ResultSet rs = pstmt.executeQuery();
            rs.next();

            password = rs.getString("client_password");

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return password;

    }
    public String getUserName(String client_id) {
        connect();

        String sql = "select client_name from client_info1 where client_id = ?";
        String client_name = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, client_id);

            ResultSet rs = pstmt.executeQuery();
            rs.next();

            client_name = rs.getString("client_name");

            rs.close();
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return client_name;
    }
}

