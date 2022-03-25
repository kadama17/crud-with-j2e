/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DAO.ConnexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Contact;

/**
 *
 * @author kadama
 */
public class ContactFacade {
    
 
    
     public  List<Contact> findAll() {
        List<Contact> contact = new ArrayList<Contact>();
        
            String q = "select * from Contact";
            try (
                    Statement stm = ConnexionBD.getConnexion();
                    ResultSet rs = stm.executeQuery(q);

                ){		      
         while(rs.next()){
                int id_contact=rs.getInt(1);
                String firstName=rs.getString(2);
                String lastName= rs.getString(3);
                String email=rs.getString(4);
                int phone= rs.getInt(5);
                String address= rs.getString(6);
                
                
                contact.add(new Contact(id_contact, firstName, lastName, email, phone, address));
                System.out.println(contact);
                 }
                         System.out.println(contact);

         return contact;
         
      } catch (SQLException e) {
         e.printStackTrace();
      }   
        return null;
 
 
    }

  public  void create (Contact c){
        try {
            Statement stm = ConnexionBD.getConnexion();
            String q = "insert into Contact values(0,'" + c.getFirstname() + "','"+c.getLastname() + "','" +c.getEmail()+"',"+c.getPhone() +",'"+c.getAddress() +"')";
            System.out.println(q);
            stm.executeUpdate(q);
        }
        
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

     public  void deleteContact(int id) {
         try {
            Statement stm = ConnexionBD.getConnexion();
            String q = "delete from Contact where ID_CONTACT="+id;
            stm.executeUpdate(q);
            System.out.print("Suppression reussie!!!");
        }
        
        catch (Exception ex) {
            ex.printStackTrace();
        }
         
    }
     
            public void updateContact(Contact c){
           try{
            Statement stmt =ConnexionBD.getConnexion();
        String q = "update Contact set FIRSTNAME='" +c.getFirstname()+ "', LASTNAME='" +c.getLastname()+ "',EMAIL='" +c.getEmail()+"', PHONE='" +c.getPhone()+ "', ADDRESS='" +c.getAddress()+ "' where ID_CONTACT='" + c.getId_contact()+ "'";
        int update = stmt.executeUpdate(q);
            
             }
        catch(Exception ex){ex.printStackTrace();}
}
}
