/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ContactFacade;
import dao.UserFacade;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.Contact;
import model.Users;

/**
 *
 * @author kadama
 */
public class ControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Contact co= new Contact();
        Users u = new Users();
         String do_this = request.getParameter("do_this");
                ContactFacade cont =new ContactFacade();
                 if (do_this==null) {
        // definir le contexte pour une redirection sur LA PAGE ACCUEIL.JSP
                     ServletContext sc = getServletContext();        
        // CHARGER LA liste des CONTACTS DANS LA requête pour les
        // TRANSMETTRE A LA JSP ACCUEIL.addContact.jspJSP (qui VA les AFFICHER)

        request.setAttribute("listecontacts", cont.findAll());
        
        RequestDispatcher rd = sc.getRequestDispatcher("/Affichage.jsp");

        rd.forward(request, response);
        
        } else if (do_this.equals("delete")) {
            // RECUPERATION de l'id du CONTACT
            String id = (String) request.getParameter("id_contact");
        if (id == null) {
        // redirection sur LA PAGE REMOVECONTACT.JSP
        response.sendRedirect("removecontact.jsp");
        } else {
        // id non nul, donc on supprime le CONTACT identifié PAR id
        
        cont.deleteContact(Integer.parseInt(id));
        // on RECHARGE LA PAGE D'ACCUEIL
        response.sendRedirect("ControllerServlet");
        }
        } else if (do_this.equals("create")) {
            
            // RECUPERATION du nom CONTACT
            String lastName = (String) request.getParameter("lastName");
        if (lastName == null) {
        // redirection sur LA PAGE REMOVECONTACT.JSP
        response.sendRedirect("addContact.jsp");
        } else {
        // TODO le nom n'est PAS nul, donc on AJOUTE le CONTACT DANS LA BASE
        
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName =request.getParameter("firstName");
        String email= request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String address = request.getParameter("address");
                        

            cont.create(new Contact(id, firstName, lastName, email,phone,address));
        // on RECHARGE LA PAGE D'ACCUEIL

       response.sendRedirect("ControllerServlet");
        }
        } else if (do_this.equals("updateForm")) {
                
            co.setId_contact(Integer.parseInt(request.getParameter("contact_id")));
            co.setFirstname(request.getParameter("firstName"));
            co.setLastname(request.getParameter("lastname"));
            co.setEmail(request.getParameter("email"));
            co.setPhone(Integer.parseInt(request.getParameter("phone")));
            co.setAddress(request.getParameter("address"));
    request.setAttribute("contact", co);
               request.getRequestDispatcher("/updateForm.jsp").forward(request, response);
 
            }
        else if (do_this.equals("update")){
            co.setId_contact(Integer.parseInt(request.getParameter("id_contact")));
            co.setFirstname(request.getParameter("firstname"));
            co.setLastname(request.getParameter("lastname"));
            co.setEmail(request.getParameter("email"));
            co.setPhone(Integer.parseInt(request.getParameter("phone")));
            co.setAddress(request.getParameter("address"));
            cont.updateContact(co);
            response.sendRedirect("ControllerServlet");

        }
        
        else if (do_this.equals("search")) {
            
           int  id_search = Integer.parseInt(request.getParameter("id_search"));
            try {
             
                ArrayList<Contact>  c= cont.get(id_search);
                if (!c.isEmpty()){
               request.setAttribute("searchResult", cont.get(id_search));
               request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
      
                }
                
                else {
               request.getRequestDispatcher("/searchResult.jsp").forward(request, response);

                
                }
                
          
                
                
            } catch (Exception ex) {
                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

}
                 
                 
                 else if(do_this.equals("register")){
                    int id = Integer.parseInt(request.getParameter("id"));
                   String name= request.getParameter("name");
                   String email= request.getParameter("email");
                   String password= request.getParameter("password");
                   u.setName(name);
                   u.setEmail(email);
                   u.setPassword(password);
                   
                    UserFacade uf = new UserFacade();
                    uf.create(u);
                               response.sendRedirect("ControllerServlet");

                }
                 
                 else if (do_this.equals("login")){
    
            try {
                              
     Users user = new Users();
     user.setEmail(request.getParameter("email"));
     user.setPassword(request.getParameter("password"));
                user = UserFacade.login(user);
                   if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user); 
          response.sendRedirect("ControllerServlet"); //logged-in page      		
     }
                        else {
          response.sendRedirect("loginPage.jsp"); //error page 
} 
                
                
            } catch (SQLException ex) {
                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	    
     

                 }
                
        }
        

    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
