package tp5ej4;

public class CoroSemicircular extends Coro {

    private Coristas[] semiCircular;
    private int df, dl;

    public CoroSemicircular(String nombre, Director dire, int df) {
        super(nombre, dire);
        this.df = df;
        this.dl = 0;
        this.semiCircular = new Coristas[df];
    }

    @Override
    public void agregarCorista(Coristas c) {
        if (this.dl < this.df) {
            semiCircular[this.dl++] = c;
        } else {
            System.out.println("El coro no admite mas Coristas2");
        }
    }

    @Override
    public boolean estaLleno() {
        return this.dl == this.df;
    }

    @Override
    public boolean estaBienFormado() {
        int aux = 0;
        while ((aux < (this.dl - 1)) && (semiCircular[aux].getTonoFundamental() > semiCircular[aux + 1].getTonoFundamental())) {
            aux++;
        }
        return aux == (this.dl - 1);
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dl; i++) {
            aux += (i + 1) + ")" + semiCircular[i].toString()+"\n";
        }
        return super.toString() + aux;
    }
}
