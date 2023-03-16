/*
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Ej1TrianguloMain {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Ej1Triangulo t = new Ej1Triangulo();
        t.setLado1(GeneradorAleatorio.generarDouble(25));
        t.setLado2(GeneradorAleatorio.generarDouble(25));
        t.setLado3(GeneradorAleatorio.generarDouble(25));
        t.setColorLinea("Rojo");
        t.setColorLinea("negro");
        System.out.println("Lado 1: "+ t.getLado1());
        System.out.println("Lado 2: "+ t.getLado2());
        System.out.println("Lado 3: "+ t.getLado3());
        System.out.println("EL perimetro es: "+t.calcularPerimetro());
        System.out.println("EL Area es: "+t.calcularArea());
    }
}
