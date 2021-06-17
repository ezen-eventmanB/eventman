package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	
	Connection conn = null;
	
	
		String url ="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String id = "system";
		String password = "1234";		
		
		public Connection getConnection() { 
			try{	
				//드라이버 객체 생성
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//드라이버 연결
				conn = DriverManager.getConnection(url, id, password);
				//out.println("접속성공");
			}catch(Exception e){
				e.printStackTrace();
				//out.println("접속실패");
			}
			return conn;
		}

}
