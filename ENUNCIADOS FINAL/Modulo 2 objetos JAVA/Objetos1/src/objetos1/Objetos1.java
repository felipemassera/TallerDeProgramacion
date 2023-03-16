
package objetos1;

import PaqueteLectura.GeneradorAleatorio;
import java.util.Arrays;

public class Objetos1 {
/*Realice un programa que instancie una estantería para 5 estantes y 3 libros por estante.
    Almacene 7 libros en la estantería. A partir de la estantería: saque un libro
    e informe su representación String; luego,  informe el título del libro más pesado.*/
    public static void main(String[] args) {

        Estantes est = new Estantes(5, 3);
        GeneradorAleatorio.iniciar();
        
        Libros l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 0, 0);
        l = new Libros("Mujercitas", GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 0, 1);
         l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 0, 2);
         l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 1, 0);
         l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 1, 1);
         l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 2, 2);
         l = new Libros(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarString(2), GeneradorAleatorio.generarDouble(4));
        est.almacenarLibro(l, 2, 1);
        
        System.out.println(est.toString());
        System.out.println("El libro encontrado es: "+est.sacarLibro("MujerciTas").toString());
        System.out.println("El libro mas pesado es "+  est.calcular().getTitulo());
        
    }    
}
