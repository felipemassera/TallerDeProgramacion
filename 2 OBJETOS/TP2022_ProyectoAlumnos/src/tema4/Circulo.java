/** 5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
 * (double), el color de relleno (String) y el color de línea (String).
 * Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
 * Provea métodos para:  *
 */
package tema4;

import tema3.*;

public class Circulo extends Figura{

    private double radio;

    public Circulo(String unCR, String unCL) {
        super(unCR, unCL);
    }
    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

 
//- Calcular el perímetro y devolverlo (método calcularPerimetro)
 @Override
    public double calcularPerimetro(){
        
        return 2*Math.PI*this.getRadio();
    }
//- Calcular el área y devolverla (método calcularArea)
    @Override
    public double calcularArea(){
        
        return Math.PI* Math.pow(this.getRadio(), 2);
    }
    
    @Override
    public String toString() {
        String aux  = super.toString()+ " Circulo " + "radio=" + radio;
        return aux;
    }

}
