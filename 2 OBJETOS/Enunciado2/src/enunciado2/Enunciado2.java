package enunciado2;

import PaqueteLectura.GeneradorAleatorio;


public class Enunciado2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Expendedora vect = new Expendedora(10);

        for (int i = 0; i < 10; i++) {
            Gaseosa g = new Gaseosa(10, GeneradorAleatorio.generarDouble(400));
            vect.agregarGaseosa(g);
        }
        for (int i = 0; i < 5; i++) {
            vect.expender(GeneradorAleatorio.generarInt(10));
        }
        System.out.println(vect.toString());
        System.out.println(vect.darInfo(10));
        System.out.println("La gaseosa mas vendida es: " + vect.masVendida());
    }

}
