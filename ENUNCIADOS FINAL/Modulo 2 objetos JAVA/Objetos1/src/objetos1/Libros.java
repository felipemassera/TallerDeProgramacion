


package objetos1;

//. Una estantería mantiene sus libros organizados en N estantes cada uno con lugar para M libros.
//Un libro posee título, nombre de su primer autor y peso
public class Libros {
   private String titulo;
   private String autor;
   private double peso;

   public Libros(String titulo, String autor, double peso) {
        this.titulo = titulo;
        this.autor = autor;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro: " + titulo + " autor: " + autor + " peso: " + peso;
    }
   
   
   
}
