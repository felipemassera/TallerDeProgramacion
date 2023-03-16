/**
 * Definir una clase para representar triángulos. Un triángulo se caracteriza por el
 * tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
 * Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
 * Provea métodos para:
 * - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
 * - Calcular el perímetro y devolverlo (método calcularPerimetro)
 * - Calcular el área y devolverla (método calcularArea)
 */
package tema3;

public class Ej1Triangulo {

    private double lado1,lado2, lado3;
    private String colorLinea, colorRelleno;

    public Ej1Triangulo() {
    }

    public Ej1Triangulo(double lado1, double lado2, double lado3, String colorLinea, String colorRelleno) {
        this.lado1 = lado1; //base
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorLinea = colorLinea;
        this.colorRelleno = colorRelleno;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    /**
     * NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) ,
     * donde a, b y c son los lados y s =a+b+c/ 2 . La función raíz cuadrada es
     * Math.sqrt(#)
     */
    public double calcularPerimetro() {
        return this.getLado1() + this.getLado2() + this.getLado3();
    }

    public double calcularS() {
        return (calcularPerimetro()) / 2;
    }

    public double calcularArea() {
        double S=calcularS();
        return Math.sqrt(S*(S-this.getLado1())*(S - this.getLado2())*(S - this.getLado3()));
    }

    @Override
    public String toString() {
        return "Ej1Triangulo{" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + ", colorLinea=" + colorLinea + ", colorRelleno=" + colorRelleno + '}';
    }

}
