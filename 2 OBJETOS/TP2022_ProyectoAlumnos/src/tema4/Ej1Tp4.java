package tema4;

public class Ej1Tp4 {

    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo(22, 33, 20, "Rojo", "Amarillo");
        Circulo circulo = new Circulo(22, "Azul", "Fluor");
        
        System.out.println(triangulo);
        triangulo.despintar();
        System.out.println("Despintado: "+triangulo);
        
        System.out.println(circulo);
        circulo.despintar();
        System.out.println("Despintado: "+circulo);
        
    }
    
}
