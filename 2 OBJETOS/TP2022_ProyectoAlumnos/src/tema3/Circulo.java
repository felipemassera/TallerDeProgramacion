/** 5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
 * (double), el color de relleno (String) y el color de línea (String).
 * Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
 * Provea métodos para:  *
 */
package tema3;

public class Circulo {

    private double radio;
    private String relleno, linea;

    public Circulo() {
    }

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

 
//- Calcular el perímetro y devolverlo (método calcularPerimetro)
    public double calcularPerimetro(){
        
        return 2*Math.PI*this.getRadio();
    }
//- Calcular el área y devolverla (método calcularArea)
    public double calcularArea(){
        
        return Math.PI* Math.pow(this.getRadio(), 2);
    }
    
    @Override
    public String toString() {
        return "Circulo " + "radio=" + radio + ", relleno=" + relleno + ", linea=" + linea;
    }

}
