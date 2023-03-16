package tema4;

public class VisorFigurasModificada {
    /*Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a 
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura*/
    private int capacidadMaxima = 5;
    private int guardadas;
    private Figura[] vector;

    public VisorFigurasModificada() {
      this.vector =new Figura[capacidadMaxima];
      this.guardadas = 0;
    }

    public void guardar(Figura f) {
        this.vector[guardadas++]=f;
    }

    public boolean quedaEspacio() {
        return (this.guardadas<this.capacidadMaxima);
    }

    public void mostrar() {
        String aux="";
        for (int i = 0; i < guardadas; i++) {    
         aux += this.vector[i].toString()+"\n";
        }
        System.out.println(aux);
    }

    public int getGuardadas() {
        return guardadas;
    }

}
