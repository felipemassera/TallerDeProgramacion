package tp5ej4;

public class Coristas extends Persona{

    /*nombre, DNI, edad y el tono fundamental*/
    private int tonoFundamental;

    public Coristas(String nombre, int edad, int dni) {
        super(nombre, edad, dni);
    }

    public Coristas(String nombre, int edad, int dni,int tonoFundamental) {
        super(nombre, edad, dni);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return super.toString() + ", tonoFundamental: " + tonoFundamental;
    }

}
