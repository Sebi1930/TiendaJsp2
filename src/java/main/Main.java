package main;

import CRUD.CrearCuentaCRUD;


public class Main {
    public static void main(String[] args) {

        
   CrearCuentaCRUD crud = new CrearCuentaCRUD();
        
        // Agregar persona
         crud.agregarCuenta("ANDRES123","dddd", "dadad@dfaffa", "123455151", "12323dada");
    }
}
