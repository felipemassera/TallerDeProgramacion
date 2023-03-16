package tp5ej1;
/*De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.*/
public class Subsidio {

    private double monto;
    private String motivo;
    private boolean otorgado;
    //inciso 1

    public Subsidio() {
    }
    
    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
    
    }
