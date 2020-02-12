/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/**
 *
 * @author Jose
 */
public class Carrito extends HttpServlet {
        private ArrayList<Producto> hamburguesas = null;
	private ArrayList<Producto> complementos = null;
	private ArrayList<Producto> bebidas = null;
        private ArrayList<Producto> listadoProductos = null;
    	public void init(ServletConfig config) throws ServletException {
                listadoProductos = new ArrayList<Producto>();
                listadoProductos.add(new Producto(1,"Hamburguesa normal","burger/normal.png","hamburguesas",5.00f,0));
		listadoProductos.add(new Producto(2,"Hamburguesa con queso","burger/queso.png","hamburguesas",5.50f,0));
		listadoProductos.add(new Producto(3,"Hamburguesa doble","burger/doble.png","hamburguesas",7.00f,0));
                listadoProductos.add(new Producto(4,"Patatas fritas","burger/patatas.png","complementos",1.50f,0));
		listadoProductos.add(new Producto(5,"Nuggets","burger/nuggets.png","complementos",3.00f,0));
		listadoProductos.add(new Producto(6,"Aros de cebolla","burger/aros.png","complementos",2.00f,0));
                listadoProductos.add(new Producto(7,"Agua","burger/agua.png","bebidas",1.00f,0));
		listadoProductos.add(new Producto(8,"Coca-Cola","burger/cocacola.png","bebidas",2.00f,0));
		listadoProductos.add(new Producto(9,"Sprite","burger/sprite.png","bebidas",2.00f,0));
		listadoProductos.add(new Producto(10,"Fanta","burger/fanta.png","bebidas",2.00f,0));
                              
               hamburguesas = new ArrayList<Producto>();
               complementos = new ArrayList<Producto>();
               bebidas = new ArrayList<Producto>();
               for ( int i=0;i<listadoProductos.size();i++) {
                   Producto miProducto = listadoProductos.get(i);
                   String categoria = miProducto.getCategoria();
                    switch ( categoria  ) {
                        case "hamburguesas":
                                hamburguesas.add(miProducto);
                                break;
                        case "complementos":
                                complementos.add(miProducto);
                                break;
                        case "bebidas":
                                bebidas.add(miProducto); 
                                break;
                    }       
                } /*for*/
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Carrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Carrito at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        }
    }

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
        // TODO Auto-generated method stub
		request.setAttribute("hamburguesas", hamburguesas);
		request.setAttribute("complementos", complementos);
		request.setAttribute("bebidas", bebidas);
		
		request.getRequestDispatcher("carrito.jsp").forward(request, response);
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
        ArrayList<Producto> carrito = new ArrayList<Producto>();
			float total = 0f;
                        int numeroProductos=listadoProductos.size();
                        Producto ultimoProducto = listadoProductos.get(numeroProductos-1);
                        int ultimoID = ultimoProducto.getId();
                        for(int i=1;i<=ultimoID;i++) { /* for sobre todos los inputs del formulario */
                            int unidades=0;
                            if ( request.getParameter(String.valueOf(i) ) !=null) {
                            unidades = Integer.parseInt(request.getParameter(String.valueOf(i)));
                            }                              
                            if ( unidades>0 ) { 
                                    for(int h=0;h<numeroProductos;h++) {
                                         Producto miProducto = listadoProductos.get(h);   
                                         if(miProducto.getId() == i ) {
                                             Producto productoAlCarrito = new Producto(miProducto.getId(),miProducto.getNombre(),
                                                miProducto.getImagen(),miProducto.getCategoria(),
                                                miProducto.getPrecio(),unidades);
                                                //miProducto.setTotal(unidades * miProducto.getPrecio());
                                                miProducto.setTotal(28);
                                                total += (unidades * miProducto.getPrecio());
                                                carrito.add(productoAlCarrito);
                                         }
                                    }
                            }                                                  
                        }
                        /* envía el listado del productos del carrito al resumen.jsp */
			request.setAttribute("carrito", carrito);
			request.setAttribute("total",String.valueOf(total));
			request.getRequestDispatcher("resumen.jsp").forward(request, response);
    }
}
