package tema4;
public class Ej5Tp4 {
/* Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el 
visor y por último haga que el visor muestre sus figuras almacenadas*/
    public static void main(String[] args) {
        VisorFigurasModificada vf = new VisorFigurasModificada();
        
        Cuadrado c1 = new Cuadrado(4, "Rojo", "Negro");
        Cuadrado c2 = new Cuadrado(7, "Verde", "Amarillo");
        Rectangulo r = new Rectangulo(5,8, "Turquesa", "Azul");
        vf.guardar(c1);
        vf.guardar(c2);
        vf.guardar(r);
        vf.mostrar();
        
    }
    
}
