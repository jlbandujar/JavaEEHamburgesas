<%-- 
    Document   : carrito.jsp
    Created on : 03-feb-2020, 14:03:55
    Author     : Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TPV Hamburguesería</title>
            <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    </head>
    <body style="padding:30px">

        <h1>TPV Hamburguesería</h1>
         
        <form action="Carrito" method="post">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#hamburguesas" role="tab">Hamburguesas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#bebidas" role="tab">Bebidas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#complementos" role="tab">Complementos</a>
          </li>
        </ul>
         <div class="tab-content" id="myTabContent">
             <div class="tab-pane fade show active" id="hamburguesas" role="tabpanel" aria-labelledby="home-tab">
                 <table class="table table-hover">
                    <thead>
                       <tr>
                         <th></th>
                         <th>Producto</th>
                         <th>Precio</th>
                         <th>Unidades</th>
                       </tr>
                     </thead>       
                     <tbody>
                          <% 
                             ArrayList<Producto> hamburguesas = ( ArrayList<Producto>) request.getAttribute("hamburguesas");       

                           Producto mihamburguesa=null;
                           for ( int i=0;i<hamburguesas.size();i++){
                                mihamburguesa = hamburguesas.get(i);
                           %>
                         <tr>
                           <td>
                             <img src="<%=mihamburguesa.getImagen()%>" />	                
                           </td>
                           <td>
                             <%=mihamburguesa.getNombre()%>

                           </td>
                           <td>
                             <%=mihamburguesa.getPrecio()%>		                
                           </td>
                           <td>
                              <input type="number" name="<%=mihamburguesa.getId()%>" value="0"/>
                           </td>
                         </tr>
                       <%  } /* for */%>
                     </tbody>
                     </table>  
                 
             </div> <!-- panel hamburguesas -->
             <div class="tab-pane fade" id="complementos" role="tabpanel" aria-labelledby="profile-tab">
                 <table class="table table-hover">
                    <thead>
               <tr>
                 <th></th>
                 <th>Producto</th>
                 <th>Precio</th>
                 <th>Unidades</th>
               </tr>
             </thead>       
             <tbody>
                  <% 
                     ArrayList<Producto> complementos = ( ArrayList<Producto>) request.getAttribute("complementos");       
               
                   Producto micomplemento=null;
                   for ( int i=0;i<complementos.size();i++){
                        micomplemento = complementos.get(i);
                   %>
                 <tr>
                   <td>
                     <img src="<%=micomplemento.getImagen()%>" />	                
                   </td>
                   <td>
                     <%=micomplemento.getNombre()%>
                    
                   </td>
                   <td>
                     <%=micomplemento.getPrecio()%>		                
                   </td>
                   <td>
                      <input type="number" name="<%=micomplemento.getId()%>" value="0"/>
                   </td>
                 </tr>
               <%  } /* for */%>
             </tbody>
             </table> 
             </div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
            </div>
   
            
            
   
                    
             
             
            <br>
            <input type="submit" value="Pedir">
        </form>
        
    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>
