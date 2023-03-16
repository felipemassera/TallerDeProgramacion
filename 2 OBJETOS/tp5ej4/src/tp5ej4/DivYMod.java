package tp5ej4;

public class DivYMod {

    private int lado, lado2;
    private int[][] vector;
    private int dl, df;

    public DivYMod(int lado, int lado2) {
        this.lado = lado;
        this.lado2 = lado2;
        this.vector = new int[lado][lado2];
        this.dl = 0;
        this.df = lado * lado2;
    }

    public int getLado() {
        return lado;
    }

    public void setLado(int lado) {
        this.lado = lado;
    }

    public int[][] getVector() {
        return vector;
    }

    public void setVector(int[][] vector) {
        this.vector = vector;
    }

    public int getDl() {
        return dl;
    }

    public void setDl(int dl) {
        this.dl = dl;
    }

    public void agregarCorista(int c) {
        if (this.dl < this.df) {
            this.vector[this.dl / this.lado2][this.dl % this.lado2] = c;
            this.dl++;
        }
    }

     public boolean estaBienFormado() {
        int aux = 0;
        int aux2 = 0;
            while ((aux < (this.lado - 1)) && (this.vector[aux][0]> vector[aux + 1][0])) {
                while ((aux2 < this.lado2 - 1) && (vector[aux][aux2]== vector[aux][aux2 + 1])) {
                    aux2++;
                }
                if (aux2 == this.lado2 - 1) {
                    aux++;
                    aux2 = 0;
                } else {
                    return false;
                }
            }  
            if (aux == (this.lado - 1)) {
                while ((aux2 < this.lado2 - 1) && (vector[aux][aux2]== vector[aux][aux2 + 1])) {
                    aux2++;
                }
                if (aux2 == this.lado2 - 1) {
                    return true;
                }
            }
        return false;
     }

     public void mostrarvect() {
        for (int i = 0; i < this.lado; i++) {
            for (int j = 0; j < this.lado2; j++) {
                System.out.print(this.vector[i][j] + "  ");
            }
            System.out.println("");
        }
    }
}
