/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DAO.ConnexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Contact;
import model.Users;

/**
 *
 * @author kadama
 */
public class UserFacade {
    
    
    
public static Users login(Users u) throws SQLException{
     String email = u.getEmail();    
         String password = u.getPassword();   
         String q ="select * from users where email='" + email + "' AND password='"+ password+"'";
         
               System.out.println("Query: "+q);
               
            try {
                    Statement stm = ConnexionBD.getConnexion();
                    ResultSet rs = stm.executeQuery(q);

                		      
         if(!rs.next()){
                 System.out.println("Sorry, you are not a registered user! Please sign up first");
           // user.setValid(false);
                
                 }
            else if (rs.next()) 
         {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            u.setId(id);
            u.setName(name);
            u.setEmail(rs.getString("email"));
            u.setValid(true);
         }

         }
            
             catch (Exception ex) 
      {
         System.out.println("Log In failed: An Exception has occurred! " + ex);
      } 
       
            return u;
}

    
  public  void create (Users u){
        try {
            Statement stm = ConnexionBD.getConnexion();
            String q = "insert into users values(0,'" + u.getName()+ "','"+u.getEmail()+ "','" +u.getPassword()+"')";
            System.out.println(q);
            stm.executeUpdate(q);
        }
        
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    
}
