/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import model.Contact;

import java.util.List;

/**
 *
 * @author kadama
 */
public interface IContact {
    
       public void create(Contact c);
   public List <Contact>findAll();
    
}
