<%-- 
    Document   : resumen
    Created on : 03-feb-2020, 15:08:25
    Author     : Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Su pedido</h1>
        <table class="table table-hover">
	        <thead>
	          <tr>
	            <th></th>
	            <th>Producto</th>
	            <th>Precio</th>
	            <th>Unidades</th>
	            <th>Total</th>
	          </tr>
	        </thead>
	        <tbody>
                 <% 
                     ArrayList<Producto> carrito = ( ArrayList<Producto>) request.getAttribute("carrito");       
               
                   Producto miproducto=null;
                   for ( int i=0;i<carrito.size();i++){
                        miproducto = carrito.get(i);
                   %>
                   <tr>
                    <td>
	              	<img src="<%=miproducto.getImagen()%>"/>	                
	             </td>
                      <td>
                            <%= miproducto.getNombre() %>
                      </td>
                      <td>
	                 <%=miproducto.getPrecio() %>  	                
                      </td>
                      <td>
                            <%=miproducto.getUnidades() %>  
	              </td>
	              <td>
                            <%=miproducto.getTotal() %>
                            ${producto.total}&euro; 
	               </td>
                    </tr>
                    <% } %>   
                    
 		</table>	
                <table class="table table-hover">
	        <thead>
	          <tr>
	            <th></th>
	            <th>Producto</th>
	            <th>Precio</th>
	            <th>Unidades</th>
	            <th>Total</th>
	          </tr>
	        </thead>
	        <tbody>
                    
                 
                    <tr>
	          	<td colspan="4"></td>
	          	<td align="center">
                                <% String total = ( String ) request.getAttribute("total"); %> 
                                <%=total%>    
	          	</td>
	          </tr>
		</table>
		<a href="Carrito" class="btn btn-primary">Volver</a>
    </body>
</html>
