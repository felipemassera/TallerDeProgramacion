package tp5ej4;

public abstract class Coro {

    private String nombre;
    private Director dire;

    public Coro(String nombre, Director dire) {
        this.nombre = nombre;
        this.dire = dire;
    }

    public abstract void agregarCorista(Coristas c);

    public abstract boolean estaLleno();

    public abstract boolean estaBienFormado();

    @Override
    public String toString() {
        return "Coro: " + nombre + "\n" + " Director: " + dire.toString() + "\n" + "Coristas: " + "\n";
    }

}
