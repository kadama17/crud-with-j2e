/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;

/**
 *
 * @author kadama
 */
public class ConnexionBD {
    
        
    
    public static String url="jdbc:mysql://localhost:3306/gestion_contact";
	public static String login="root";
	public static String password="Pegnimin";
            static Statement stm=null;

	public static Connection cnx = null;
	
public static Statement getConnexion() {
Statement st = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	cnx = DriverManager.getConnection(url, login, password);
	st= cnx.createStatement();
	
}
	catch(ClassNotFoundException e){
		e.printStackTrace();
		
	}
catch(SQLException e1) {
	e1.printStackTrace();
	return st;
	
	
}
return st;
}


    
public static int UID(String sql)
    {
        int code=0;
        try{
      code= stm.executeUpdate(sql);
      System.out.println("OpÃ©ration ok");
        
        }catch(SQLException se)
        {
          System.out.println("Erreur lors de l'exÃ©cution de la req SQL !!!");
        }
        return code;
    }
  
    public static ResultSet Select(String sql)
    {
        
	
         try{
             cnx = DriverManager.getConnection(url, login, password);
	stm= cnx.createStatement();
      return stm.executeQuery(sql);
        }catch(SQLException se)
        {
          System.out.println("Erreur lors de l'exÃ©cution de la req SQL !!!");
        }
        return null;
    }

}
