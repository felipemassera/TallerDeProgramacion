package tema4;

public class Ej4Tp4 {

    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();

        Cuadrado c1 = new Cuadrado(10, "Violeta", "Rosa");
        Rectangulo r = new Rectangulo(20, 10, "Azul", "Celeste");
        Cuadrado c2 = new Cuadrado(30, "Rojo", "Naranja");

        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);

        System.out.println(visor.getMostradas());

/*- Un objeto visor de figuras se encarga de mostrar en consola cualquier figura que reciba 
y también mantiene cuántas figuras mostró. Analice y ejecute el siguiente programa y 
responda: ¿Qué imprime? ¿Por qué?
*/
//Muestra 3 ya que el visor por cada vez que muesre un Objeto(ToString) sumara uno en su contador interno, NO HAY metodo SET mostradas.
    }

}
