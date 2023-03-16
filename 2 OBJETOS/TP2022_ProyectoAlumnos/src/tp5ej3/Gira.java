/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp5ej3;

/*Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la 
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el 
número de la fecha en la que se tocará próximamente (actual)
 */
public class Gira extends Recital {

    private String nombreGira;
    private Fecha[] fechas;
    private int df, dl, actual;

    public Gira(String nombreGira,String nombreBanda, int cantCanciones, int df1) {
        super(nombreBanda, cantCanciones);
        this.nombreGira = nombreGira;
        this.df = df1;
        this.dl = 0;
        this.actual = 0;
        this.fechas = new Fecha[df1];
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public void setFechas(Fecha[] fechas) {
        this.fechas = fechas;
    }

    public int getCantFechas() {
        return df;
    }

    /* agregarFecha que recibe una “fecha” y la agrega adecuadamente.*/
    public void agregarFecha(Fecha f) {
        if (this.dl < this.df) {
            this.fechas[dl++] = f;
        }
    }

    /* La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda 
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego 
debe imprimir el listado de temas como lo hace cualquier recital. Además debe 
establecer la siguiente fecha de la gira como la nueva “actual*/
    public String actuar() {
        if (this.actual < this.dl) {
            return "Buenas noches ..." + this.fechas[this.actual++].getLocalidad() + super.actuar();
        }
        return "No hay mas fechas en cola";
    }

    @Override
    public String toString() {

        String aux = "";
        for (int i = 0; i < this.dl; i++) {
            aux += this.fechas[i].toString();
        }
        return "Gira " + "nombreGira: " + nombreGira + "\n"
                + " Fechas: " + "\n" + aux;
    }

    @Override
    public int calcularCosto() {
        return 30000 * dl;
    }
}
