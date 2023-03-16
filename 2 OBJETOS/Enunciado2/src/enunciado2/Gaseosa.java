


package enunciado2;


public class Gaseosa {
    private int stock;
    private double precio;
    private int vendido;

    public Gaseosa(int S, double P) {
        this.stock = S;
        this.precio = P;
        this.vendido = 0;
    }


    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getVendido() {
        return vendido;
    }

    public void setVendido(int vendido) {
        this.vendido = vendido;
    }

    @Override
    public String toString() {
        return "|Gaseosa:" + "stock =" + stock + ", precio =" + precio + ", vendido =" + vendido + '|';
    }
    
}

