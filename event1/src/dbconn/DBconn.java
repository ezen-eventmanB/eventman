package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
   
   private Connection conn = null;
   private String coninfo = "jdbc:mysql://jjezen.cafe24.com/ezen20210719_b";
   private String odomfo = "user_b";
   private String pwdinfo = "user1234!!";
   
      public Connection getConnection() { 
      try{   

         Class.forName("com.mysql.jdbc.Driver");

         conn = DriverManager.getConnection(coninfo, odomfo, pwdinfo);

      }catch(Exception e){
         e.printStackTrace();

      }
      return conn;
   }

}