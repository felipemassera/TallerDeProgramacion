/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp5ej3;

/**
 * De todo recital se conoce el nombre de la banda y la lista de temas que
 * tocarán durante el recital.
 */
public abstract class Recital {

    private String nombreBanda;
    private String[] listaTemas;
    private int df, dl;

    public Recital(String nombreBanda, int df) {
        this.nombreBanda = nombreBanda;
        this.df = df;
        this.dl = 0;
        this.listaTemas = new String[df];
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    /* agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas. 
     */
    public void agregarTema(String tema) {
        if (this.dl < this.df) {
            this.listaTemas[dl++] = tema;
        }
    }

    /* actuar que imprime (por consola) para cada tema la leyenda “y ahora 
tocaremos…” seguido por el nombre del tema.*/
    public String actuar() {
        String aux = "";
        for (int i = 0; i < this.dl; i++) {
            aux += " Y ahora tocaremos..." + this.listaTemas[i] + "\n";
        }
        return aux;
    }

    public abstract int calcularCosto();

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dl; i++) {
            aux += this.listaTemas[i] + "\n";
        }
        return "Recital de " + nombreBanda + " Lista Temas: " + "\n" + aux;
    }

}
