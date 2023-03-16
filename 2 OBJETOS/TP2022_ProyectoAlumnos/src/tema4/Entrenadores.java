package tema4;

public class Entrenadores extends Empleado {
//Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos ganados.

    private int campeonatosGanados;

    public Entrenadores(String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
    }

    public Entrenadores(int campeonatosGanados, String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

    /*La efectividad 
del entrenador es el promedio de campeonatos ganados por año de antigüedad*/
    @Override
    public double calcularEfectividad() {
        double aux = ((double) this.campeonatosGanados / super.getAntiguedad());
        return aux;
    }

    /*calcularSueldoACobrar: El sueldo a 
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha 
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos; 
50.000$ si ha ganado más de 10 campeonatos).*/
    @Override
    public double calcularSueldoACobrar() {
        double aux = super.getSueldoB() + super.getSueldoB() * (super.getAntiguedad() * 0.1);
        if (this.campeonatosGanados > 0 && this.campeonatosGanados <= 4) {
            return aux + 5000;
        } else if (this.campeonatosGanados > 4 && this.campeonatosGanados <= 10) {
            return aux + 30000;
        } else if (this.campeonatosGanados > 10) {
            return aux + 50000;
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    @Override
    public String toString2() {
        return super.toString2() + ", campeonatosGanados: " + campeonatosGanados;
    }

}
