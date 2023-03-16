package tp5ej4;

public class CoroPorHileras extends Coro {

    private Coristas[][] porHileras;
    int dfFilas, dfColumnas, dlFilas, dlColumnas;

    public CoroPorHileras(String nombre, Director dire, int DFilas, int DColumnas) {
        super(nombre, dire);
        this.dfFilas = DFilas;
        this.dfColumnas = DColumnas;
        this.dlFilas = 0;
        this.dlColumnas = 0;
        this.porHileras = new Coristas[DFilas][DColumnas];
    }

    public Coristas[][] getPorHileras() { //SACRLO DESPUES
        return porHileras;
    }

    @Override
    public void agregarCorista(Coristas c) {
        if (this.dlFilas < this.dfFilas) {
            porHileras[this.dlFilas][this.dlColumnas++] = c;
            if (this.dlColumnas == this.dfColumnas) {
                this.dlColumnas = 0;
                this.dlFilas++;
            }
        } else {
            System.out.println("El coro no admite mas coristas Coro por Hileras 1");
        }
    }

    @Override
    public boolean estaLleno() {
        return (this.dlFilas == this.dfFilas);
    }

    @Override
    public boolean estaBienFormado() {
        int aux = 0;
        int aux2 = 0;
        if (estaLleno()) {
            while ((aux < (this.dlFilas - 1)) && (porHileras[aux][0].getTonoFundamental() > porHileras[aux + 1][0].getTonoFundamental())) {
                while ((aux2 < this.dfColumnas - 1) && (porHileras[aux][aux2].getTonoFundamental() == porHileras[aux][aux2 + 1].getTonoFundamental())) {
                    aux2++;
                }
                if (aux2 == this.dfColumnas - 1) {
                    aux++;
                    aux2 = 0;
                } else {
                    return false;
                }
            }
            if (aux == (this.dlFilas - 1)) {
                while ((aux2 < this.dfColumnas - 1) && (porHileras[aux][aux2].getTonoFundamental() == porHileras[aux][aux2 + 1].getTonoFundamental())) {
                    aux2++;
                }
                if (aux2 == this.dfColumnas - 1) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dfFilas; i++) {
            for (int j = 0; j < this.dfColumnas; j++) {
                if (porHileras[i][j] != null) {
                    aux += (i + 1) + "-" + (j + 1) + ") " + porHileras[i][j].toString() + "\n";
                }
            }
        }
        return super.toString() + aux;
    }

}
