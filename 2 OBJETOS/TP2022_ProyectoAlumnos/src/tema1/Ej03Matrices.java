/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
//Paso 1. importar la funcionalidad para generar datos aleatorios

public class Ej03Matrices {

    public static void main(String[] args) {
        int df = 5;
        //Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int[][] matriz = new int[df][df];
        for (int i = 0; i < df; i++) {
            for (int j = 0; j < df; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
            }
        }

        //Paso 4. mostrar el contenido de la matriz en consola
        imprimirMatriz(matriz);
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (int i = 0; i < df; i++) {
            suma = suma + matriz[0][i];
        }
        System.out.println("La suma de todos los elementos de la fila 1: " + suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int[] vector = new int[5];
        for (int i = 0; i < df; i++) {
            for (int j = 0; j < df; j++) {
                vector[j] = vector[j] + matriz[i][j];
            }
        }
        imprimirVector(vector);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("ingrese el valor a buscar en la matriz");
        int dato=PaqueteLectura.Lector.leerInt();
        boolean ok=false;
        int f=0,c=0;
        for (int i = 0; i < df; i++) {
            for (int j = 0; j < df; j++) {
                if (matriz[i][j]==dato) {
                    f=i; c=j;
                    ok= true;
                    break;
                }
                if (ok) {
                    break;
                }
            }
        }
        if (ok) {
            System.out.println("EL DATO ESTA EN LA FILA"+ f +"Columna "+ c);
        }else{
            System.out.println("No se encontró el elemento");
        }
    }

    public static void imprimirMatriz(int[][] matriz) {

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                System.out.print(" ");
                System.out.print(matriz[i][j]);
            }
            System.out.println("  ");
        }
    }

    public static void imprimirVector(int[] vect) {
        System.out.println("IMPRIMO VECTOR");
        for (int j = 0; j < 5; j++) {
            System.out.print(vect[j]+" ");
        }
        System.out.println("");
    }
}
