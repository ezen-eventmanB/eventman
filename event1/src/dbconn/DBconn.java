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
				//����̹� ��ü ����
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//����̹� ����
				conn = DriverManager.getConnection(url, id, password);
				//out.println("���Ӽ���");
			}catch(Exception e){
				e.printStackTrace();
				//out.println("���ӽ���");
			}
			return conn;
		}

}
