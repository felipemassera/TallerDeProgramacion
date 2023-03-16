/*Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que 
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al 
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de 
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro. 
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;

public class Ej04Edificio {

    public static void main(String[] args) {
        int pisos = 8, oficina = 4;
        int[][] matriz = new int[pisos][oficina];

        System.out.println("ingrese el piso al que desea ingresar");
        int datoP = PaqueteLectura.Lector.leerInt();

        while (datoP != 9) {
            System.out.println("Ingrese el numero de oficina a ingresar");
            int datoO = PaqueteLectura.Lector.leerInt();
            matriz[datoP - 1][datoO - 1]++;
            System.out.println("ingrese el piso al que desea ingresar");
            datoP = PaqueteLectura.Lector.leerInt();
        }
        imprimirMatriz(matriz);
    }
    public static void imprimirMatriz(int [][]m){
        for (int i = 0; i < 4; i++) {
            System.out.print("C"+(i+1)+"|");
        }
        System.out.println("");    
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(m[i][j]+"  ");
            }
            System.out.println("piso "+(i+1)+"");
        }
    }
}
