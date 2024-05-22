package servlets;

import CRUD.CrearCuentaCRUD;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CrearCuentaServlet", urlPatterns = {"/crearCuenta"})
public class CrearCuentaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("Ntelefono");
        String contrasena = request.getParameter("contraseña");
        
        CrearCuentaCRUD crud = new CrearCuentaCRUD();
        crud.agregarCuenta(nombre, apellido, correo, telefono, contrasena);
        
        // Redirigir a alguna página de confirmación o de éxito
        response.sendRedirect("registroExitoso.jsp");
    }
}
