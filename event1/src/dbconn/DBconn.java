package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	
	static Connection conn = null;
	
	
		static String url ="jdbc:oracle:thin:@192.168.0.198:1521:xe";
		static String id = "system";
		static String password = "1234";		
		
		public static Connection getConnection() { 
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
