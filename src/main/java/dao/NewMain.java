/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;
import model.Contact;
/**
 *
 * @author kadama
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        ContactFacade cf = new ContactFacade();
      //  cf.create(new Contact(1, "kone", "adama", "kadama@gmail.com", 555, "adddkj"));
        //c.create(c);
        cf.get(33);
      //  cf.updateContact(new Contact(3, "kone", "adama", "kadama@gmail.com", 555, "adddkj"));
    }
    
}
