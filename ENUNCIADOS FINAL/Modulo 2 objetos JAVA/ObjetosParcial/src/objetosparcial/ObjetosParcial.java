package objetosparcial;

public class ObjetosParcial {

    public static void main(String[] args) {
        
        DeBienes bien = new DeBienes("Tito", 45687, "11/05/22", 4);
        for (int i = 0; i < 4; i++) {
            Bien b1 = new Bien(("No me gusta esta casa " + i), i, (Math.random() * 10000));
            bien.agregarBien(b1);
        }
        
        DeEstadia e= new DeEstadia("LasToninas", 541.45, 14, 3500, "Joaco", 69, "13/10/22");
        
        System.out.println(e.toString());
        
        System.out.println(bien.toString());
    }

}
