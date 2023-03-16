package tema4;

public class Jugadores extends Empleado {
//Los jugadores son empleados que se caracterizan por el número de partidos jugados y 
//el número de goles anotados

    private int nPartidos;
    private int golesAnotados;

    public Jugadores(String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
    }

    public Jugadores(int nPartidos, int golesAnotados, String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
        this.nPartidos = nPartidos;
        this.golesAnotados = golesAnotados;
    }

    public int getnPartidos() {
        return nPartidos;
    }

    public void setnPartidos(int nPartidos) {
        this.nPartidos = nPartidos;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    @Override
    public double calcularEfectividad() {
        return ((double) golesAnotados / nPartidos);
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = super.getSueldoB() + super.getSueldoB() * (super.getAntiguedad() * 0.1);
        if (calcularEfectividad() > 0.5) {
            return aux + (super.getSueldoB() / 10);
        }
        return aux;
    }

    @Override
    public String toString2() {
        return super.toString2() + ", nPartidos: " + nPartidos + ", golesAnotados: " + golesAnotados;
    }

    @Override
    public String toString() {
        return super.toString2();
    }

}
