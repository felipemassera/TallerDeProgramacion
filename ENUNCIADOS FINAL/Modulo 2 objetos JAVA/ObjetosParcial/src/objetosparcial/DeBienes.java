package objetosparcial;

public class DeBienes extends Subsidio {

    private Bien[] vect;
    private int dl, df;

    public DeBienes(String nInvestigador, int nPlan, String fecha, int df) {
        super(nInvestigador, nPlan, fecha);
        this.vect = new Bien[df];
        this.df= df;
        this.dl=0;
    }
    
    
    public void agregarBien(Bien b){
        if (this.dl<this.df) {
            vect[dl++]= b;
        }
    }

    @Override
    public double montoTotal() {
        double aux=0;
        for (int i = 0; i < dl; i++) { 
           aux+= vect[i].getCosto()*vect[i].getCantidad();
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux ="";
        for (int i = 0; i < this.dl; i++) {
            aux+= this.vect[i].toString();
        }
        return super.toString()+ ", Monto total: "+ montoTotal()+"\n" + aux;
    }
            
            
}
