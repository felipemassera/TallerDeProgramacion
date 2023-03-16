/*d) Realice un programa que instancie un evento ocasional y una gira, cargando la 
información necesaria. Luego, para ambos, imprima el costo e invoque al mensaje actuar.

 */
package tp5ej3;

public class Tp5Ej3 {

    public static void main(String[] args) {
        Dia dia= new Dia(19,02, 2022);
//        EventoOcasional evento = new EventoOcasional("PriVado", "Pappo", dia, "BeeGees", 15);
//        evento.agregarTema("Comando culoo mandril");
//        evento.agregarTema("una pepa mas");
//        evento.agregarTema("te recabio");
//        evento.agregarTema("El gordito es lo mas, metalero never more");
//        System.out.println(evento.actuar());
//        System.out.println("El costo por el evento es: "+ evento.calcularCosto());
//        
        
        
        Gira unaGira = new Gira("RockstarPops","Pampa Yakuza",15 ,5);
        Fecha f = new Fecha("Tolosa", 3, 2, 1988);
        unaGira.agregarFecha(f);
        f = new Fecha("Ringuelet", 5, 7, 2023);
        unaGira.agregarFecha(f);
        unaGira.agregarTema("Culto satan");
        unaGira.agregarTema("Cultivador");
        unaGira.agregarTema("Ahhhrelocooo");
        System.out.println(unaGira.actuar());
        System.out.println(unaGira.actuar());
        System.out.println(unaGira.actuar());
        System.out.println("El costo por la Gira es: "+ unaGira.calcularCosto());
        
    }

}
