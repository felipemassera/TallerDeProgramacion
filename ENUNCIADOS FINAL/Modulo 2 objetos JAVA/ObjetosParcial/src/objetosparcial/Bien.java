


package objetosparcial;

import java.util.Vector;


public class Bien {

    private String descripcion;
    private int cantidad;
    private double costo;

    public Bien() {
    }

    public Bien(String descripcion, int cantidad, double costo) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costo = costo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    @Override
    public String toString() {
        return  ", descripcion: " + descripcion+"."+"\n";
    }
    
    
    
}
