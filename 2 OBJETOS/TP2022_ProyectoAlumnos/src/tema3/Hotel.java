/*4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.*/
package tema3;

public class Hotel {

    private int nHab;
    private Habitacion[] habitaciones;// = new Habitacion [nHab];

    public Hotel() {
    }

    public Hotel(int nHab) {
        this.nHab = nHab;
        this.habitaciones = new Habitacion[nHab];
        iniciarHotel();
        
    }

    public int getnHab() {
        return nHab;
    }

    public void setnHab(int nHab) {
        this.nHab = nHab;
    }

    public Habitacion[] getHotel() {
        return habitaciones;
    }

    public void setHotel(Habitacion[] hotel) {
        this.habitaciones = hotel;
    }
    /*inicializo el hotel */
    private void iniciarHotel(){
        for (int i = 0; i < this.getnHab(); i++) {
            habitaciones[i]= new Habitacion();
        }
    }
    //Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está en el rango 1..N) y que la habitación está libre.
    public void ingresarCliente(int pos, Cliente c) {
        if (!habitaciones[pos].isOcupado()) {
            habitaciones[pos].setCliente(c);
            habitaciones[pos].setOcupado(true);
        System.out.println("Entro a ingresar cliente setee OCUPADO");
       } else {
            System.out.println("La habitacion esta ocupada");
       }
    }

    // Aumentar el precio de todas las habitaciones en un monto recibido
    public void aumentarPrecio(int valor) {
        for (int i = 0; i < nHab; i++) {
            habitaciones[i].setPrecio(habitaciones[i].getPrecio() + valor);
        }
    }

    /*{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}*/
    @Override
    public String toString() {
        String texto = "";
        for (int i = 0; i < this.getnHab(); i++) {
            texto+= "Habitacion "+i+": "+habitaciones[i].toString() + "\n";
        }
        return texto;

    }
}
