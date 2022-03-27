/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author kadama
 */
public class Users {
    private int id;
    private String name; 
    private String email;
    private String password; 
    private boolean valid;
    public Users() {
    }
    
        public Users(String email, String password) {
    this.email=email;
    this.password=password;
    
}
        
                public Users(String email, String name, boolean valid) {
    this.email=email;
    this.name=name;
   this.valid=valid;
    
}

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }


    public Users(int it, String name, String email, String password) {
    this.id=id;
    this.name=name;
    this.email=email;
    this.password=password;
    
}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
