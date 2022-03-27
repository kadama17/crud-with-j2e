<%@page import="model.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; CHARSET=ISO-8859-1">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">


<title>Accueil</title>
</head>
        <body>
            
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

            
            
             
            <center>               
                        
    <div class="flex flex-col">
        <div class="w-full">
            <div class="border-b border-gray-200 shadow">
                <table class="mt-10 mb-10">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                ID
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                FIRSTNAME
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                LASTNAME
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                EMAIL
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                PHONE
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                ADDRESS
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                EDIT
                            </th>
                            <th class="px-6 py-2 text-xs text-gray-500">
                                DELETE
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        
<c:forEach var="co" items="${requestScope.listecontacts}">
       <tr>
           <td class="px-6 py-4 text-sm text-gray-500">
                                ${co.id_contact}
                            </td>
                            <td class="px-6 py-4">
                                <div class="text-sm text-gray-900">
                                    ${co.firstname}
                                </div>
                            </td>
                               <td class="px-6 py-4">
                                <div class="text-sm text-gray-900">
                                    ${co.lastname}
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <div class="text-sm text-gray-500">${co.email}</div>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-500">
                                ${co.phone}
                            </td>
                            
                            <td class="px-6 py-4 text-sm text-gray-500">
                                ${co.address}
                            </td>
                            <td class="px-6 py-4">
                                
                                
                                 <a  href="ControllerServlet?do_this=updateForm&contact_id=${co.id_contact}&firstName=${co.firstname}&lastname=${co.lastname}&email=${co.email}&phone=${co.phone}&address=${co.address}">
                                 <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-400" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                    </svg>
                                 </a>
                                
                            </td>
                            <td class="px-6 py-4">
                                <a  href="ControllerServlet?do_this=delete&id_contact=${co.id_contact}">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-red-400" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>

                               </a> 
                            </td>
                        </tr>
                                                      </c:forEach>

                    </tbody>
                </table>
  
            </div>
        </div>
                        <a href="addContact.jsp">                      
<button class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center">
  <span>New contact</span>
</button>        
      </a>
    </div>
                       
</center>
                       

                       
</body>
</head>
