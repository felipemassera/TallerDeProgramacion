


package objetosparcial;


public abstract class Subsidio {

    private String nInvestigador;
    private int nPlan;
    private String fecha;

    public Subsidio(String nInvestigador, int nPlan, String fecha) {
        this.nInvestigador = nInvestigador;
        this.nPlan = nPlan;
        this.fecha = fecha;
    }

    public String getnInvestigador() {
        return nInvestigador;
    }

    public void setnInvestigador(String nInvestigador) {
        this.nInvestigador = nInvestigador;
    }

    public int getnPlan() {
        return nPlan;
    }

    public void setnPlan(int nPlan) {
        this.nPlan = nPlan;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public abstract double montoTotal();

    @Override
    public String toString() {
        return "nInvestigador=" + nInvestigador + ", nPlan=" + nPlan + ", Fecha de Solicitud=" + fecha;
    }
    
    
}
