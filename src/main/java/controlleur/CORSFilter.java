/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlleur;

/**
 *
 * @author kadama
 */
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class CORSFilter implements Filter {
 
 
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain) throws IOException, ServletException {
         
 
        HttpServletRequest  request   = (HttpServletRequest)servletRequest;
        HttpServletResponse response  = (HttpServletResponse)servletResponse;
 
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,PATCH,OPTIONS");
        response.addHeader("Access-Control-Allow-Headers", request.getHeader("Access-Control-Request-Headers"));     
  
        // For HTTP OPTIONS verb reply with ACCEPTED status code, for CORS handshake
        if (request.getMethod().equals("OPTIONS")) {
            response.setStatus(HttpServletResponse.SC_ACCEPTED);
            return;
        }
 
        filterChain.doFilter(servletRequest, servletResponse);
    }
 
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }
 
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub       
    }   
}