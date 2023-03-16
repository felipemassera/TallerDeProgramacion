package tema4;
public class Triangulo extends Figura {
 private double lado1;
 private double lado2;
 private double lado3;

    public Triangulo(String unCR, String unCL) {
        super(unCR, unCL);
    }

    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
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

 
    private double calcularS() {
        return (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
    }

    @Override
    public double calcularArea() {
        double S=calcularS();
        return Math.sqrt(S*(S-this.getLado1())*(S - this.getLado2())*(S - this.getLado3()));
    }

    @Override
    public double calcularPerimetro() {
      return this.getLado1() + this.getLado2() + this.getLado3();
    }
 
    @Override
    public String toString() {
        String aux =" Triangulo " + "lado1: " + lado1 + ", lado2: " + lado2 + ", lado3: " + lado3+ super.toString();
        return aux;
    }
}
