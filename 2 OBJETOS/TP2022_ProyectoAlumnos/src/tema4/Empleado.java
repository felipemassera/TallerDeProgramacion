


package tema4;


public abstract class Empleado {
// Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad
    private String nombre;
    private double sueldoB;
    private int antiguedad;


    public Empleado(String nombre, double sueldoB, int antiguedad) {
        this.nombre = nombre;
        this.sueldoB = sueldoB;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoB() {
        return sueldoB;
    }

    public void setSueldoB(double sueldoB) {
        this.sueldoB = sueldoB;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
   
    @Override
    public String toString() {
        String aux = " Nombre: " + this.nombre +
                ", Efectividad: "+ this.calcularEfectividad()+
                ", Sueldo a cobrar: $"+this.calcularSueldoACobrar();     
        return  aux;
    }
    public String toString2() {
        String aux = " Nombre: " + this.nombre +
                ", SueldoBasico: " + this.sueldoB +
                ", Antiguedad: " + this.antiguedad+
                ", Efectividad: "+ this.calcularEfectividad()+
                ", Sueldo a cobrar: $"+this.calcularSueldoACobrar();     
        return  aux;
    }

    
    
    
}
