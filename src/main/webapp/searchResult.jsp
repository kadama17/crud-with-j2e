<%-- 
    Document   : searchResult
    Created on : 26 mars 2022, 00:31:13
    Author     : kadama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
              <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

            <title>SEARCH PAGE</title>
        </head>
        <body>
            
            <!-- Navbar -->
<nav
        class="flex items-center justify-between flex-wrap bg-gray-800 py-4 lg:px-12 shadow border-solid border-t-2 border-blue-700">
        <div class="flex justify-between lg:w-auto w-full lg:border-b-0 pl-6 pr-2 border-solid border-b-2 border-gray-300 pb-5 lg:pb-0">
            <div class="flex items-center flex-shrink-0 text-gray-800 mr-16">
                <span class="font-semibold text-xl tracking-tight">CRUD J2EE</span>
            </div>
            <div class="block lg:hidden ">
                <button
                    id="nav"
                    class="flex items-center px-3 py-2 border-2 rounded text-blue-700 border-blue-700 hover:text-blue-700 hover:border-blue-700">
                    <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>HOME</title>
                        <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/>
                    </svg>
                </button>
            </div>
        </div>
    
        <div class="menu w-full lg:block flex-grow lg:flex lg:items-center lg:w-auto lg:px-3 px-8">
             <div class="flex space-x-4">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="./ControllerServlet" class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium" aria-current="page">Home</a>

            <a href="./addContact.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Create</a>

            <a href="./ControllerServlet" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">List</a>
         </div>
            
            
            
            <!-- This is an example component -->
            <div class="relative mx-auto text-gray-600 lg:block hidden">
                           <form action="ControllerServlet" method="POST">
                           <input type="hidden" name="do_this" value="search">

                <input
                    class="border-2 border-gray-300 bg-white h-10 pl-2 pr-8 rounded-lg text-sm focus:outline-none"
                    type="search" name="id_search" placeholder="Search">
                <button type="submit" class="absolute right-0 top-0 mt-3 mr-2">

                    
                    
                    
                    <svg class="text-gray-600 h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg"
                         version="1.1" id="Capa_1" x="0px" y="0px"
                         viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;"
                         xml:space="preserve"
                         width="512px" height="512px">
                <path
                    d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z"/>
              </svg>
                </button>
                                </form>

            </div>

        </div>
    
    </nav>
            
            

                        <c:if test="${!empty searchResult}">

                     <c:forEach var="rs" items="${requestScope.searchResult}">
<div class="w-full max-w-screen-xl mx-auto px-6">
        <div class="flex justify-center p-4 px-3 py-10">
            <div class="w-full max-w-md">
                <div class="bg-white shadow-md rounded-lg px-3 py-2 mb-4">
                   
                     <div class="block text-gray-700 text-lg font-semibold py-2 px-2">
                         Details sur le contact No:   ${rs.id_contact}   
                     </div>
                    <div class="py-3 text-sm">
                        <div class="flex justify-start cursor-pointer text-gray-700 hover:text-blue-400 hover:bg-blue-100 rounded-md px-2 py-2 my-2">
                            <span class="bg-gray-400 h-2 w-2 m-2 rounded-full"></span>
                            <div class="flex-grow font-medium px-2">FirstName</div>
                                    ${rs.firstname}                        
                            </div>
                            
                               <div class="flex justify-start cursor-pointer text-gray-700 hover:text-blue-400 hover:bg-blue-100 rounded-md px-2 py-2 my-2">
                            <span class="bg-gray-400 h-2 w-2 m-2 rounded-full"></span>
                            <div class="flex-grow font-medium px-2">LastName</div>
                                    ${rs.lastname}                        
                            </div>
                               <div class="flex justify-start cursor-pointer text-gray-700 hover:text-blue-400 hover:bg-blue-100 rounded-md px-2 py-2 my-2">
                            <span class="bg-gray-400 h-2 w-2 m-2 rounded-full"></span>
                            <div class="flex-grow font-medium px-2">Email</div>
                                    ${rs.email}                        
                            </div>
                               <div class="flex justify-start cursor-pointer text-gray-700 hover:text-blue-400 hover:bg-blue-100 rounded-md px-2 py-2 my-2">
                            <span class="bg-gray-400 h-2 w-2 m-2 rounded-full"></span>
                            <div class="flex-grow font-medium px-2">Phone</div>
                                    ${rs.phone}                        
                            </div>
                               <div class="flex justify-start cursor-pointer text-gray-700 hover:text-blue-400 hover:bg-blue-100 rounded-md px-2 py-2 my-2">
                            <span class="bg-gray-400 h-2 w-2 m-2 rounded-full"></span>
                            <div class="flex-grow font-medium px-2">Address</div>
                                    ${rs.address}                        
                            </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
                               </c:forEach>
        </c:if>

              <c:if test="${empty searchResult}">
  <center>         

                  <button class="mt-40 bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">
  No contact found
</button>
</center>         
             </c:if>
   

        
        

        
   
        </body>
    </html>
</f:view>
