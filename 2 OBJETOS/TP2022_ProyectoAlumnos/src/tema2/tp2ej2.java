package tema2;

import PaqueteLectura.GeneradorAleatorio;

/*2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta 
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.*/
public class tp2ej2 {

    public static void main(String[] args) {
        int df = 15;
        Persona[] vectorP = new Persona[df];
        vectorP=cargarArrayPersona(vectorP);
        mostrarVector(vectorP);
    }

    public static void mostrarVector(Persona [] v){
       int i=1;
        for (Persona aux : v) {
            if ( aux != null) {
            System.out.println((i++)+") "+aux);
            }
        }
    }
    public static Persona[] cargarArrayPersona(Persona[] v) {
        PaqueteLectura.GeneradorAleatorio.iniciar();
        int i = 0;
        Persona p = new Persona();
        p = cargarPersona(p);
        while ((i < 15) && (p.getEdad()!= 0)) {
            v[i++]=p;
            p = new Persona();
            p = cargarPersona(p);
        }
        return v;
    }

    public static Persona cargarPersona(Persona p) {
        p.setEdad(GeneradorAleatorio.generarInt(100));
        if (p.getEdad() != 0) {
            p.setDNI(GeneradorAleatorio.generarInt(50000));
            p.setNombre(GeneradorAleatorio.generarString(10));
        }
        return p;
    }
}
