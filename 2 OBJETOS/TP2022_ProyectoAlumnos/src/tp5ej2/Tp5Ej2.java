package tp5ej2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class Tp5Ej2 {
//IMPORTAR PAQUETE LECTURA, EXPORTAR ARCHIVO
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacionamiento e = new Estacionamiento("Lo de pancho", 454767, 10, 16, 3, 3);
        Auto a;
        for (int i = 0; i < 6; i++) {
            a = new Auto(GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(5));
            e.agregarAuto(a, GeneradorAleatorio.generarInt(3), GeneradorAleatorio.generarInt(3));
        }
        System.out.println(e.toString());
        System.out.println("La cantidad de autos en la plaza 1 es "+e.autosEnPlaza(0));
        
        System.out.println("Ingrese la patente del auto a buscar");
        int aux = Lector.leerInt();
        System.out.println(e.buscarAuto(aux));
    }
    
}
