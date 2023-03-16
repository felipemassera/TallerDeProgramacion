package tema1;

/**
 * 5- El dueño de un restaurante entrevista a cinco clientes y les pide que
 * califiquen (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al
 * cliente (1) Calidad de la comida (2) Precio (3) Ambiente. Escriba un programa
 * que lea desde teclado las calificaciones de los cinco clientes para cada uno
 * de los aspectos y almacene la información en una estructura. Luego imprima la
 * calificación promedio obtenida por cada aspecto
 */
public class Ej05Restaurante {

    public static void main(String[] args) {
        PaqueteLectura.GeneradorAleatorio.iniciar();
        double[][] matriz = new double[5][4];
        System.out.println("INGRESE EL PUNTAJE DE 1..10 EN LAS CATEGORIAS");
        for (int i = 0; i < 5; i++) {
            System.out.println("CLIENTE: " + (i + 1));
            System.out.println("Atención al cliente: ");
            //matriz[i][0] = PaqueteLectura.Lector.leerDouble();
            matriz[i][0] = PaqueteLectura.GeneradorAleatorio.generarDouble(10) + 1;
            System.out.println("Calidad de la comida: ");
            //matriz[i][1] = PaqueteLectura.Lector.leerDouble();
            matriz[i][1] = PaqueteLectura.GeneradorAleatorio.generarDouble(10) + 1;
            System.out.println("Precio: ");
            //matriz[i][2] = PaqueteLectura.Lector.leerDouble();
            matriz[i][2] = PaqueteLectura.GeneradorAleatorio.generarDouble(10) + 1;

            System.out.println("Ambiente: ");
            //matriz[i][3] = PaqueteLectura.Lector.leerDouble();
            matriz[i][3] = PaqueteLectura.GeneradorAleatorio.generarDouble(10) + 1;

        }
        imprimirMatriz(matriz);
        //saco promedio
        double[] vector = new double[4];
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 4; j++) {
                vector[j] = vector[j] + matriz[i][j];
            }
        }
        //imprimo vector con promedios
        System.out.println("PROMEDIOS");
        for (int i = 0; i < 4; i++) {

            System.out.println("Categoria " + i + ": " + ((double) formatearDecimales(vector[i], 2) / 5));
        }
    }

    public static void imprimirMatriz(double[][] m) {
        for (int i = 0; i < 4; i++) {
            System.out.print("R" + (i + 1) + " | ");
        }
        System.out.println("");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(formatearDecimales(m[i][j], 2) + "  ");
            }
            System.out.println("Ciente " + (i + 1) + "");
        }
    }

    public static Double formatearDecimales(Double numero, Integer numeroDecimales) {
        return Math.round(numero * Math.pow(10, numeroDecimales)) / Math.pow(10, numeroDecimales);
    }
}
