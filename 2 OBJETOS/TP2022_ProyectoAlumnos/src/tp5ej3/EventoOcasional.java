/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp5ej3;

/*
Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV 
o show privado), el nombre del contratante del recital y el día del evento.*/
public class EventoOcasional extends Recital {

    private String motivo;
    private String nombreContratante;
    private Dia fechaEvento;

    public EventoOcasional(String motivo, String nombreContratante, Dia fechaEvento, String nombreBanda, int df) {
        super(nombreBanda, df);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.fechaEvento = fechaEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String actuar() {
        if (this.motivo.equalsIgnoreCase("beneficencia")) {
            return "Recuerden colaborar con…" + this.nombreContratante + super.actuar();
        } else if (this.motivo.equalsIgnoreCase("tv")) {
            return "Saludos amigos televidentes" + super.actuar();

        } else if (this.motivo.equalsIgnoreCase("privado")) {
            return "Un feliz cumpleaños para…" + this.nombreContratante + super.actuar();
        }
        return super.actuar();

    }

    @Override
    public int calcularCosto() {
        if (this.motivo.equalsIgnoreCase("beneficencia")) {
            return 0;
        } else if (this.motivo.equalsIgnoreCase("tv")) {
            return 50000;

        } else if (this.motivo.equalsIgnoreCase("privado")) {
            return 150000;
        }
        return -1;
    }

}
