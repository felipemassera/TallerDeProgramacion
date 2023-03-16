package tema3;

public class Cliente{

    private String nombre;
    private long DNI;
    private int edad;

    public Cliente() {
    }

    public Cliente(String nombre, long DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getDNI() {
        return DNI;
    }

    public void setDNI(long DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return " Nombre: " + nombre + " DNI: " + DNI + ". Edad: " + edad;           
    }
    
    
}
