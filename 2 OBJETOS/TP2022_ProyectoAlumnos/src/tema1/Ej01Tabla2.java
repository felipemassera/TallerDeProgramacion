/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
       
       int DF=11;
        int [] tabla2 = new int[10]; // indices de 0 a 9
        int i = 0;
        GeneradorAleatorio.iniciar();
       int value = GeneradorAleatorio.generarInt(12);
       while ((i<DF)&&(value!=11)){
           tabla2[i++] = value;
           value= GeneradorAleatorio.generarInt(12);
        }
        System.out.println("el valor es "+value);
        for (int j=0;j<i;j++) //tabla2.length siempre muestra la cantidad maxima de elementos posibles
            System.out.println ("En la posicion: " + j + " Esta el elemento: " + tabla2[j]);

        for (int j=0;j<i;j++) {
            tabla2[j] = tabla2[j]*2;
            System.out.println("La multiplicacion del elemento por 2 en la posicion: " + j + " es igual a: "+ tabla2[j]);
        }
    }
}