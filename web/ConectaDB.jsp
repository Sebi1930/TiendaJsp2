<%-- 
    Document   : ConectaDB
    Created on : 20 may. 2024, 6:37:30 p. m.
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>function getConexion() {
    var hostname = "127.0.0.1";
    var username = "root";
    var password = "";
    var database = "center";
    var port = "3306";
    var cn = new mysqli(hostname, username, password, database, port);
    
    if (cn.connectError) {
        console.error("Error al conectar: " + cn.connectError);
    } else {
        console.log("Conexión establecida");
    }
    
    return cn;
}</script>

    </body>
</html>
