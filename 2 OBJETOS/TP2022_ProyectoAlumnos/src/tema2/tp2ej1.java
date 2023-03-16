package tema2;

import PaqueteLectura.Lector;

public class tp2ej1 {

        /*Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego 
muestre en consola la representación de ese objeto en formato String.*/
    public static void main(String[] args) {
        Persona p = new Persona ();
        
        System.out.print("Ingrese Nombre de la persona: ");
        p.setNombre(Lector.leerString());
        System.out.println("");
        System.out.print("DNI: ");
        p.setDNI(Lector.leerInt());
        System.out.println("");
        System.out.print("Edad: ");
        p.setEdad(Lector.leerInt());
        System.out.println("");
        
        System.out.println(p);
    }
    
}
