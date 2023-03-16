package objetos1;

public class Estantes {

    private Libros[][] estante;
    private int fila, columna;

    public Estantes(int fila, int columna) {
        this.fila= fila;
        this.columna=columna;
        this.estante = new Libros[fila][columna];
    }
//almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y
    //guarda al libro en la estantería. Asuma que dicho lugar está disponible.

    public void almacenarLibro(Libros l, int f, int c) {
        estante[f][c] = l;
    }
//sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título,
// quedando su lugar disponible. Tenga en cuenta que el libro puede no existir.

    public Libros sacarLibro(String buscar) {
        Libros aux = null;
        int i = 0, j = 0;
        while (i < this.fila) {
            while ((j < this.columna)) {
                if ((estante[i][j] != null) && (estante[i][j].getTitulo().equalsIgnoreCase(buscar))) {
                    aux = estante[i][j];
                    estante[i][j] = null;
                    return aux;
                }
                j++;
            }
            i++;
            j = 0;
        }
        return aux;
    }

//calcular: calcula y devuelve el libro más pesado de la estantería.
    public Libros calcular() {
        Libros aux = null;
        double masPesado = -1;
        for (int i = 0; i < this.fila; i++) {
            for (int j = 0; j < this.columna; j++) {
                if ((estante[i][j] != null) && (estante[i][j].getPeso() > masPesado)) {
                    masPesado = estante[i][j].getPeso();
                    aux = estante[i][j];
                }
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.fila; i++) {
            for (int j = 0; j < this.columna; j++) {
                if (estante[i][j]!=null) {
                aux += (i + 1) + "-" + (j + 1) + ") " + estante[i][j].toString() + "\n";
                }else{
                 aux += 0+"\n";   
                }

            }
        }
        return "Estante: " + "\n" + aux;
    }

}
