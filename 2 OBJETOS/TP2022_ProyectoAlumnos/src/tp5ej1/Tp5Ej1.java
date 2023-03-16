package tp5ej1;

public class Tp5Ej1 {

    /*Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos 
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima 
todos los datos del proyecto en pantalla.
     */
    public static void main(String[] args) {

        Proyecto proyecto1 = new Proyecto("Covid-19", 20199102, "Gines");

        Investigador Inves1 = new Investigador("Coco", 4, "Biologo");
        Investigador Inves2 = new Investigador("DeGiuli", 2, "Quimico");
        Investigador Inves3 = new Investigador("Juan Domingo", 1, "Sociologo");

        Subsidio unSubsidio = new Subsidio(500000, "Analisis de murcielagos");
        Inves1.agregarSubsidio(unSubsidio);
        unSubsidio = new Subsidio(47000, "Compra de peces");
        Inves1.agregarSubsidio(unSubsidio);
        unSubsidio = new Subsidio(99900, "Camisas para ovejas");
        Inves1.agregarSubsidio(unSubsidio);
        unSubsidio = new Subsidio(999, "compra de zapallos");
        Inves1.agregarSubsidio(unSubsidio);
        unSubsidio = new Subsidio(1000900, "tv compras");
        Inves1.agregarSubsidio(unSubsidio);
        Inves1.agregarSubsidio(unSubsidio);

        Subsidio dosSubsidio = new Subsidio(10405, "Benzoato de sodio");
        Inves2.agregarSubsidio(dosSubsidio);
        dosSubsidio = new Subsidio(70540, "Prueba de trichodermas");
        Inves2.agregarSubsidio(dosSubsidio);
        dosSubsidio = new Subsidio(475900, "Pruebas con trinitotolueno");
        Inves2.agregarSubsidio(dosSubsidio);
        unSubsidio = new Subsidio(500445, "analista de monos");
        Inves3.agregarSubsidio(unSubsidio);
        
        proyecto1.agregarInvestigador(Inves1);
        proyecto1.agregarInvestigador(Inves2);
        proyecto1.agregarInvestigador(Inves3);
        
        proyecto1.otorgarTodos("Juan Domingo");
        
        System.out.println(proyecto1.toString());
    }

}
