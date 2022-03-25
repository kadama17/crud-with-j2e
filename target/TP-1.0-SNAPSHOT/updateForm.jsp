
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ContactFacade"%>
<%@page import="model.*,DAO.*"%>



<%! ConnexionBD dao= new ConnexionBD();
Contact c = new Contact();

%>
<%
    c=(Contact)request.getAttribute("contact");
 
%>
         <% System.out.println("Nous sommes dans la updateForm"); %>

         
         

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
              <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

            <title>UPDATE FORM</title>
        </head>
        <body>

         
  
         
        
                 <nav class="bg-gray-800">
  <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <!-- Mobile menu button-->
        <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
          <span class="sr-only">Open main menu</span>
          <!--
            Icon when menu is closed.

            Heroicon name: outline/menu

            Menu open: "hidden", Menu closed: "block"
          -->
          <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
          <!--
            Icon when menu is open.

            Heroicon name: outline/x

            Menu open: "block", Menu closed: "hidden"
          -->
          <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
   
        <div class="hidden sm:block sm:ml-6">
          <div class="flex space-x-4">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="#" class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium" aria-current="page">Home</a>

            <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Create</a>

            <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">List</a>
          </div>
        </div>
      </div>
    

        </div>
      </div>
    </div>
  </div>

  <!-- Mobile menu, show/hide based on menu state. -->
  <div class="sm:hidden" id="mobile-menu">
    <div class="px-2 pt-2 pb-3 space-y-1">
      <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
      <a href="#" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Dashboard</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Team</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Projects</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Calendar</a>
    </div>
  </div>
</nav>
            
            
            
            
            
            <center>

            <div class="mt-30 sm:mt-0">
  <div class="md:grid md:grid-cols-3 md:gap-6">

    </div>
    <div class="mt-5 md:mt-0 md:col-span-2">
      <form action="ControllerServlet" method="GET">
        <div class="shadow overflow-hidden sm:rounded-md">
          <div class="px-4 py-5 bg-white sm:p-6">
            <div class="grid grid-cols-6 gap-6">
                
                    <div class="col-span-6 sm:col-span-3">
 <label for="id" class="block text-sm font-medium text-gray-700">Id</label>

<input type="number" value="<%=c.getId_contact()%>" name="id_contact"> 
              </div>
              
              <div class="col-span-6 sm:col-span-3">
<input type="hidden" name="do_this" value="update">
                <label for="first-name" class="block text-sm font-medium text-gray-700">First name</label>
                <input type="text" value="<%=c.getFirstname()%>" name="firstname" id="first-name" autocomplete="given-name" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-3">
                <label for="last-name" class="block text-sm font-medium text-gray-700">Last name</label>
                <input type="text" name="lastname" value="<%=c.getLastname()%>" id="last-name" autocomplete="family-name" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-3">
                <label for="email-address" class="block text-sm font-medium text-gray-700">Email address</label>
                <input type="text" name="email" value="<%=c.getEmail()%>"  id="email-address" autocomplete="email" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>
                
                   <div class="col-span-6 sm:col-span-3">
                <label for="email-address" class="block text-sm font-medium text-gray-700">PHONE</label>
                <input type="number" name="phone" value="<%=c.getPhone()%>" id="email-address"  class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>
                   <div class="col-span-6 sm:col-span-3">
                <label for="email-address" class="block text-sm font-medium text-gray-700">address</label>
                <input type="text" name="address" value="<%=c.getAddress()%>" id="email-address"  class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

            </div>
          </div>
          <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
              
              <input type="submit" value="update" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
              
          </div>
        </div>
      </form>
    </div>
  </div>
                </center>

</div>

         </body>
    </html>
</f:view>

         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
<center>
    
        <h1 >
            <u>  Modification d'un contact </u></h1>
        
    
    
      <fieldset >
        <form action="ControllerServlet" action="GET">
        <table border="0"  >
             <tr>
            <td><input type="hidden" name="do_this" value="update"></td>
        </tr>
            <tr >
            <td> Id </td>
            <td> <input type="number" value="<%=c.getId_contact()%>" name="id_contact"> </td>
            </tr>
            <br>
            <tr>
            <td> FirstNmae</td>
            <td> <input type="text" value="<%=c.getFirstname()%>" name="firstname"> </td>
            </tr>
            <br>
            <tr>
            <td> Last Name</td>
            <td> <input type="text" value="<%=c.getLastname()%>" name="lastname"> </td>
            </tr>
            <br>
            <tr>
           <td> Email </td>
            <td> <input type="text" value="<%=c.getEmail()%>" name="email"> </td>
             <td> Phone </td>
            <td> <input type="number" value="<%=c.getPhone()%>" name="phone"> </td>

             <td> Address </td>
            <td> <input type="text" value="<%=c.getAddress()%>" name="address"> </td>
            </tr>
            <br>
            <tr>
                <td> <input type="reset" value="Annuler">    </td>
            <td> <input type="submit" value="update"> </td>
            </tr> 
        </table>
                <a href="addContact.jsp"> Ajouter un nouveau contact</a>

        </form>
            </fieldset>
    </center>
