package tema3;

public class Habitacion {
 private double precio;
 private boolean ocupado;
 private Cliente cliente;

    public Habitacion() {
        this.precio= PaqueteLectura.GeneradorAleatorio.generarInt(6000)+2001;
        this.ocupado=false;
    }

    public Habitacion(Cliente cliente) {
        this.cliente = cliente;
    }
  
    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isOcupado() {
        return ocupado;
    }

    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        if (ocupado) {
        return " Precio:" + precio + ", Habitacion ocupada; "+ cliente.toString();
            
        }
        return " Precio:" + precio + ", Habitacion libre";
    }
}
