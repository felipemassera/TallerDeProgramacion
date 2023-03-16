


package tp5ej2;

//De los autos se conoce nombre del dueño y patente.
public class Auto {
private String nombreDuenio;
private int patente;

    public Auto() {
    }

    public Auto(String nombreDuenio, int patente) {
        this.nombreDuenio = nombreDuenio;
        this.patente = patente;
    }

    public String getNombreDuenio() {
        return nombreDuenio;
    }

    public void setNombreDuenio(String nombreDuenio) {
        this.nombreDuenio = nombreDuenio;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "nombre Dueño: " + nombreDuenio + " patente: " + patente ;
    }



}
