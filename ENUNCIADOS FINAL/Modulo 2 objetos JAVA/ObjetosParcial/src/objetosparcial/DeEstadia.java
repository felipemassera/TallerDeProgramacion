package objetosparcial;

public class DeEstadia extends Subsidio {

    private String destino;
    private double costoPasaje;
    private int cantDias;
    private double montoHotel;

    
    
    public DeEstadia(String destino, double costoPasaje, int cantDias, double montoHotel, String nInvestigador, int nPlan, String fecha) {
        super(nInvestigador, nPlan, fecha);
        this.destino = destino;
        this.costoPasaje = costoPasaje;
        this.cantDias = cantDias;
        this.montoHotel = montoHotel;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public double getCostoPasaje() {
        return costoPasaje;
    }

    public void setCostoPasaje(double costoPasaje) {
        this.costoPasaje = costoPasaje;
    }

    public int getCantDias() {
        return cantDias;
    }

    public void setCantDias(int cantDias) {
        this.cantDias = cantDias;
    }

    public double getMontoHotel() {
        return montoHotel;
    }

    public void setMontoHotel(double montoHotel) {
        this.montoHotel = montoHotel;
    }

    @Override
    public double montoTotal() {
       return (this.costoPasaje+(this.montoHotel*this.cantDias));
    }
    
    @Override
    public String toString() {
        return super.toString()+ ", Monto total: "+ montoTotal()+ " Lugar de destino: "+this.getDestino() + " Dias de Estadia: "+ this.cantDias;
    }

    
}
