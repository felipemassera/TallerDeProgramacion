package tp5ej4;

import PaqueteLectura.GeneradorAleatorio;

public class Tp5Ej4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Director coach = new Director("Cappusoto", 47, 3352648, 8);
        CoroPorHileras unCoroPorHileras = new CoroPorHileras("Opus4", coach, 4, 5); //matriz 4*5 =20 lugares
        CoroSemicircular unCoroSemi = new CoroSemicircular("Kennedy", coach, 20); //vector de 20 lugares

        //Genero coristas para semiCircular
        for (int i = 0; i < 21; i++) {
            Coristas c1 = new Coristas(GeneradorAleatorio.generarString(4),
                    GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(50), (100 - i)); //pongo 100-i para que vaya restando el tono asi aparecerian ordenados
            unCoroSemi.agregarCorista(c1);
        }
        //genero Coristas para coro por hileras
        for (int i = 20; i > 0; i--) {
            if (i <= 5) {
                Coristas c1 = new Coristas(GeneradorAleatorio.generarString(4),
                        GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(50), (1));
                unCoroPorHileras.agregarCorista(c1);

            } else if (i <= 10) {
                Coristas c1 = new Coristas(GeneradorAleatorio.generarString(4),
                        GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(50), (10));
                unCoroPorHileras.agregarCorista(c1);

            } else if (i <= 15) {
                Coristas c1 = new Coristas(GeneradorAleatorio.generarString(4),
                        GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(50), (15));
                unCoroPorHileras.agregarCorista(c1);
            } else if(i<=20){
                Coristas c1 = new Coristas(GeneradorAleatorio.generarString(4),
                        GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(50), (20));
                unCoroPorHileras.agregarCorista(c1);
            }
        }

        System.out.println("UN CORO Semi CIRCULAR" + "\n" + unCoroSemi.toString() + "\n");
        System.out.println("Esta completo?" + unCoroSemi.estaLleno());
        System.out.println("Esta bien ordenado? " + unCoroSemi.estaBienFormado());

        System.out.println("UN CORO POR HILERAS" + "\n" + unCoroPorHileras.toString() + "\n");
        System.out.println("Esta completo?" + unCoroPorHileras.estaLleno());
        System.out.println("Esta bien ordenado? " + unCoroPorHileras.estaBienFormado());
    }

}
