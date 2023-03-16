package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Ej5 {
/*B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e 
informe en consola el perímetro y el área.*/
    
    public static void main(String[] args) {
        Circulo c = new Circulo();
        c.setRadio(GeneradorAleatorio.generarDouble(20)+1);
        System.out.println("Area: "+c.calcularArea()+" Perimetro: "+ c.calcularPerimetro());
    }
    
}
