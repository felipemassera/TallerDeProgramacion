/*B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej4Hotel {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Ingrese la cantidad de habitaciones");
        int x = Lector.leerInt();
        Hotel h = new Hotel(x);
        cargarHotel(h);
        System.out.println(h);
        System.out.println("Ingrese el valor de aumento para las habitaciones");
        x = Lector.leerInt();
        h.aumentarPrecio(x);
        System.out.println(h);
    }

    public static void cargarHotel(Hotel h) {
        System.out.println("Ingrese la habitacion que desea ocupar");
        int salida = Lector.leerInt();
        while (salida != 99) {
            Cliente c = new Cliente();
            c.setDNI(GeneradorAleatorio.generarInt(5555));
            c.setEdad(GeneradorAleatorio.generarInt(5555));
            c.setNombre(GeneradorAleatorio.generarString(4));
            System.out.println(c);
            h.ingresarCliente(salida, c);
            System.out.println("Ingrese la habitacion que desea ocupar");
            salida = Lector.leerInt();
        }
    }
}
