
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej02Jugadores {

  
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int df=15;
        //Paso 2: Declarar la variable vector de double 
        double [] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new double[df];
        //Paso 4: Declarar indice y variables auxiliares a usar
        double promedio=0;
        int aux =0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (int j = 0; j < df; j++) {
            vector[j]=GeneradorAleatorio.generarDouble(15);
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (int i = 0; i < df; i++) {
          promedio= promedio + vector[i];  
        }
        promedio= (double) promedio / df;
        System.out.println("EL promedio es: "+ promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (int i = 0; i < df; i++) {
            if (vector[i] > promedio) {
                aux++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores que superan el promedio es: "+aux);
    }
    
}
