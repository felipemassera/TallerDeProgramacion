package tp5ej4;

public class Director extends Persona {   
    private int antiguedad;

    public Director( String nombre, int edad, int dni,int antiguedad) {
        super(nombre, edad, dni);
        this.antiguedad = antiguedad;
    }



    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString()+ ", antiguedad: " + antiguedad;
    }

}
