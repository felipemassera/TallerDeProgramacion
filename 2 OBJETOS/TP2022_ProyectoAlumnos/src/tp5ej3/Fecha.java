package tp5ej3;

public class Fecha {

    private Dia dia;
    private String localidad;

    public Fecha() {
    }

    public Fecha(String localidad, int dia, int mes, int anio) {
        this.dia = new Dia(dia, mes, anio);
        this.localidad = localidad;
    }

    public String getDia() {
        return dia.toString();
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    @Override
    public String toString() {
        return this.dia.toString() + " localidad: " + localidad;
    }

}
