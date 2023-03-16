package tema2;
import PaqueteLectura.GeneradorAleatorio;
public class tp2ej4 {
    /*Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting.
Una vez finalizada la inscripción: 
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. */
    public static void main(String[] args) {
        int f = 5, c = 8;
        Persona[][] matriz = new Persona[f][c];
        matriz = cargarMatriz(matriz, f, c);
        mostrarMatriz(matriz,f,c);
    }

    public static Persona[][] cargarMatriz(Persona[][] m, int fila, int columna) {
        Persona p = new Persona();
        int i = 0, j = 0;
        p = leerP(p);
        while ((i < fila) && (!p.getNombre().toUpperCase().equals("ZZZ"))) {
            while ((j < columna) && (!p.getNombre().toUpperCase().equals("ZZZ"))) {
                m[i][j++] = p;
                p = new Persona();
                p = leerP(p);
            }
            j=0;
            i++;
        }
        return m;
    }

    public static Persona leerP(Persona p) {
        p.setNombre(GeneradorAleatorio.generarString(3));
        if (!p.getNombre().toUpperCase().equals("ZZZ")) {
            p.setEdad(GeneradorAleatorio.generarInt(99) + 1);
            p.setDNI(GeneradorAleatorio.generarInt(99999) + 1);
        }
        return p;
    }
    public static void mostrarMatriz(Persona[][] m,int f, int c){
        for (int i = 0; i < f; i++) {
            System.out.println("DIA "+(i+1));
            for (int j = 0; j < c; j++) {
                System.out.println((j+1)+") "+m[i][j]);    
            }
        }
    }
}
