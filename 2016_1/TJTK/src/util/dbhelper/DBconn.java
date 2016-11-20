package util.dbhelper;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
 
 
public class DBconn {
    private static Connection dbConn;
   
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
               
        if(dbConn == null){        
           
            String driverName="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/lastproject";
            String id = "root";
            String pwd ="audwns12";
           
            Class.forName(driverName);     
            System.out.println("����̹��ε�");
            dbConn = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB���Ἲ��!");
        }
       
       
        return dbConn;
    }   
    public static void close() throws SQLException{
        if(dbConn!=null){   
            System.out.println("conn�ݱ�()");
            if(!dbConn.isClosed()){
                dbConn.close();
            }           
        } 
        dbConn = null;        
    }   
} 