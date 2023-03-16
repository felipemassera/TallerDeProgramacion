package tp5ej1;

/*De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad;. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios*/
public class Investigador {

    private String nombre;
    private int categoria; //1a5
    private Subsidio[] subsidios;
    private String especialidad;
    private int dlSubsidios;

//inciso 1
    public Investigador() {
    }

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[5];
        this.dlSubsidios = 0;
        for (int i = 0; i < 5; i++) {//preguntar
            this.subsidios[i] = null;
            //this.subsidios[i]= new Subsidio();
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getDlSubsidios() {
        return dlSubsidios;
    }

    public void agregarSubsidio(Subsidio unSubsidio) {
        if (dlSubsidios < 5) {
            this.subsidios[dlSubsidios++] = unSubsidio;
        } else {
            System.out.println("No se puede agregar mas subsidios a esta persona");
        }
    }

    public double subsidioOtorgadosTot() {
        double tot = 0;
        for (int i = 0; i < this.dlSubsidios; i++) {
            if (this.subsidios[i].isOtorgado()) {
                tot += this.subsidios[i].getMonto();
            }
        }
        return tot;
    }

    @Override
    public String toString() {
        String aux = "    nombre: " + nombre + "\n"+ 
                "    categoria: " + categoria + "\n"+
                "    especialidad: " + especialidad + "\n"+
                "    subsidios Total: $" + subsidioOtorgadosTot();
        return aux;
    }
}
