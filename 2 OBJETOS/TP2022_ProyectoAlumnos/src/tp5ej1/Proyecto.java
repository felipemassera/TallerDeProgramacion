package tp5ej1;

/*: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo)*/
public class Proyecto {

    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] vector;
    private int dl;

//inciso 1
    
    public Proyecto() {
    }

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.vector = new Investigador[50];
        this.dl = 0;
        for (int i = 0; i < 50; i++) { //PREGUNTAR Q ONDA
            vector[i] = null;
            //vector[i]= new Investigador();
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public Investigador[] getVector() {
        return vector;
    }

    public void setVector(Investigador[] vector) {
        this.vector = vector;
    }

    public void agregarInvestigador(Investigador unInvestigador) { //CONSULTAR
        // this.vector[dl] = new Investigador();
        this.vector[dl++] = unInvestigador;
    }

    public double dineroTotalOtorgado() {
        double montoTotal = 0;
        for (int i = 0; i < dl; i++) {
            montoTotal += this.vector[i].subsidioOtorgadosTot();
        }
        return montoTotal;
    }

    public void otorgarTodos(String nombre_completo) {
        int i = 0;
        while ((i < this.dl) && (!this.vector[i].getNombre().equalsIgnoreCase(nombre_completo))) {
            i++;
        }
        if (i < this.dl) {
            for (int j = 0; j < this.vector[i].getDlSubsidios(); j++) {
                if (!this.vector[i].getSubsidios()[j].isOtorgado()) {
                    this.vector[i].getSubsidios()[j].setOtorgado(true);
                }
            }
        }
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dl; i++) {
            aux += "Investigador: " + (i + 1)+"\n"+ this.vector[i].toString() + "\n";
        }

        return "Proyecto " +"\n"+ " nombreProyecto: " + nombre + "\n"+" codigo:" + codigo
                + "\n"+ " nombreDirector: " + nombreDirector
                + "\n"+ " Monto de subsidios otorgados al Proyecto: $" + this.dineroTotalOtorgado()
                + "\n" + aux;
    }

}
