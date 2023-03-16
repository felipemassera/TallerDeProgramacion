package enunciado2;

import java.util.Arrays;

public class Expendedora {

    private Gaseosa[] vector;
    private int df, dl;

    public Expendedora(int df) {
        this.df = df;
        this.dl = 0;
        this.vector = new Gaseosa[df];
    }

    public String darInfo(int dato) {
        if ((dato<dl)&&(vector[dato] != null)) {
            return vector[dato].toString();
        }
        return "No se encuentra la gaseosa";
    }

    public double expender(int t) {
        vector[t].setVendido(vector[t].getVendido() + 1);
        vector[t].setStock(vector[t].getStock() - 1);
        return vector[t].getPrecio();
    }

    public int masVendida() {
        int masVendido = -1, posMasVendido = -1;
        for (int i = 0; i < this.df; i++) {
            if ((vector[i] != null) && (vector[i].getVendido() > masVendido)) {
                masVendido = vector[i].getVendido();
                posMasVendido = i;
            }
        }
        return posMasVendido+1;
    }

    public void agregarGaseosa(Gaseosa g) {
        if (this.dl < this.df) {
            vector[dl++] = g;
        }
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.df; i++) {
            aux += (i+1) + ") " + this.vector[i].toString() + "\n";
        }

       return "Expendedora2000 "+"\n"+aux;
       //return "Expendedora2000 " +"\n"+ Arrays.toString(this.vector);

    }

}
