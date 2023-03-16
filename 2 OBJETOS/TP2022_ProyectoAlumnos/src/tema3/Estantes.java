/*- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.*/
/*
¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
*/
package tema3;
//EJERCICIO 3a TP3

public class Estantes {

    private Libro[] estante = new Libro [20];
    private int diml=0;
   
    public Estantes() {
    
    }
    
    public Libro[] getEstante() {
        return estante;
    }

    public void setEstante(Libro[] estante) {
        this.estante = estante;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    //(i) devolver la cantidad de libros que almacenados
    public int total() {
        return diml;
    }

    //(ii) devolver si el estante está lleno
    public boolean estaLleno() {
        return (diml == 20);
    }

    //(iii) agregar un libro al estante
    public void agregarLibro(Libro l) {
        if (diml < 20) {
            estante[diml++] = l;
        } else {
            System.out.println("No se puede agregar, estante lleno");
        }
    }

    //(iv) devolver el libro con un título particular que se recibe
    public Libro buscarLibro(String buscar) {
        int i = 0;
        while ((i < diml) && (!estante[i].getTitulo().equalsIgnoreCase(buscar))) {
            i++;
        }
        if ((i < diml) && (estante[i].getTitulo().equalsIgnoreCase(buscar))) {
            return estante[i];
        }
        return null;
    }

    @Override
    public String toString() {
        String aux=""; 
        for (int i = 0; i < this.diml; i++) {
            aux += estante[i] + "\n";
        }
        return aux;
    }
}
