package tema4;

public class Trabajadores extends Persona {

    private String tarea;

    public Trabajadores() {
    }

    public Trabajadores(String tarea, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy " + tarea;
    }

}
