package tp5ej2;

/* Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su 
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso 
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. */
public class Estacionamiento {

    private String nombre;
    private int direccion, hApertura, hCierre, plaza, piso;
    private Auto[][] matriz;

    public Estacionamiento() {
    }

    public Estacionamiento(String nombre, int direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = 8;
        this.hCierre = 21;
        this.piso = 5;
        this.plaza = 10;
        this.matriz = new Auto[piso][plaza];
    }

    public Estacionamiento(String nombre, int direccion, int hApertura, int hCierre, int plaza, int piso) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = hApertura;
        this.hCierre = hCierre;
        this.piso = piso;
        this.plaza = plaza;
        this.matriz = new Auto[piso][plaza];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDireccion() {
        return direccion;
    }

    public void setDireccion(int direccion) {
        this.direccion = direccion;
    }

    public int gethApertura() {
        return hApertura;
    }

    public void sethApertura(int hApertura) {
        this.hApertura = hApertura;
    }

    public int gethCierre() {
        return hCierre;
    }

    public void sethCierre(int hCierre) {
        this.hCierre = hCierre;
    }

    public int getPlaza() {
        return plaza;
    }

    public void setPlaza(int plaza) {
        this.plaza = plaza;
    }

    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public Auto[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Auto[][] matriz) {
        this.matriz = matriz;
    }

    /*- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto 
en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir, 
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado*/
    public void agregarAuto(Auto a, int piso, int plaza) {
        if ((piso < this.piso) && (piso >=0) && (plaza < this.plaza) && (plaza >= 0)) {
            if (this.matriz[piso][plaza]==null) {
                this.matriz[piso ][plaza] = a;
            } else {
                System.out.println("Espacio ocupado, no se realiza la operacion");
            }
        } else {
            System.out.println("Numero de piso o plaza fuera de rango");
        }
    }

    /*Dada una patente, obtener un String que contenga el número de piso y plaza 
donde está dicho auto en el estacionamiento. En caso de no encontrarse, 
retornar el mensaje “Auto Inexistente”.*/
    public String buscarAuto(int patente) {
        int i = 0, j = 0;
        while (i < this.piso) {
            while ((j < this.plaza) && (matriz[i][j]!=null)&& (matriz[i][j].getPatente() != patente)) {
                j++;
            }
            if (j == this.plaza) {
                j = 0;
                i++;
            } else if (matriz[i][j]==null){
                j++;
            }else{
                return "EL auto se encuentra en piso: " + (i + 1) + " Plaza: " + (j+1);
            }
        }
        return "Auto Inexistente";
    }
/*Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha 
plaza (teniendo en cuenta todos los pisos).
*/
    public int autosEnPlaza(int nPlaza){
        int aux=0;
        for (int i = 0; i < this.piso; i++) {
            if(this.matriz[i][nPlaza] != null){
                aux++;
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.piso; i++) {
            for (int j = 0; j < this.plaza; j++) {
                if (this.matriz[i][j]==null) {
                    aux += "Piso " + (i + 1) + " Plaza " + (j + 1) + ": Libre" + "\n";
                } else {
                    aux += "Piso " + (i + 1) + " Plaza " + (j + 1) + " " + this.matriz[i][j].toString() + "\n";
                }
            }
        }
        return "Estacionamiento " + nombre + "\n"
                + " Direccion: " + direccion + "\n"
                + " Apertura: " + hApertura + ":00" + "\n"
                + " Cierre: " + hCierre + ":00" + "\n"
                + aux;
    }

}
