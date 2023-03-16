/*B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej3estantes {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estantes e = new Estantes();
         
        while (!e.estaLleno()){
        Libro libro = new Libro();
        llenarLibro(libro);    
        e.agregarLibro(libro);
        }
        int diml = e.getDiml();
        System.out.println(e.toString()); //MUESTRO Objeto
        System.out.println("La estanteria esta llena? "+e.estaLleno());
        
        //BUSQUEDA DE X LIBRO
        System.out.println("Ingrese el libro a buscar");
        String x = Lector.leerString();
        Libro aux =e.buscarLibro(x);
        if (aux!= null) {
            System.out.println(aux.getPrimerAutor());
        }
    }
    
    public static void llenarLibro(Libro l){
        l.setTitulo(GeneradorAleatorio.generarString(3));
        l.setAñoEdicion(GeneradorAleatorio.generarInt(4));
        l.setEditorial(GeneradorAleatorio.generarString(3));
        l.setISBN(GeneradorAleatorio.generarString(3));
        Autor a= new Autor();
        a.setNombre(GeneradorAleatorio.generarString(3));
        a.setOrigen(GeneradorAleatorio.generarString(3));
        a.setBiografia(GeneradorAleatorio.generarString(3));
        l.setPrimerAutor(a); 
    }
}
