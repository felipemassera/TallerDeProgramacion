/*
 */
package tp5ej4;

/**
 *
 * @author Felipe
 */
public class DivYModMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        DivYMod d = new DivYMod(3, 3);

            d.agregarCorista(3);
            d.agregarCorista(3);
            d.agregarCorista(3);
            d.agregarCorista(2);
            d.agregarCorista(2);
            d.agregarCorista(2);
            d.agregarCorista(1);
            d.agregarCorista(1);
            d.agregarCorista(1);
            
            

        System.out.println(d.estaBienFormado());
        d.mostrarvect();
    }

}
