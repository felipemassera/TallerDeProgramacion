package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class t2ej5Servicio {

    public static void recorrerPartidos (Partido[] v,int diml){
        int golesBoque=0,ganadosRiver=0;
        for (int i = 0; i < diml; i++) {
            if (v[i].hayGanador() && v[i].getGanador().toUpperCase().equals("RIVER")) {
                ganadosRiver++;
            }
            if(v[i].getLocal().toUpperCase().equals("BOCA")){
                golesBoque+=v[i].getGolesLocal();
            }
        }
        System.out.println("Partidos ganados por river:= "+ ganadosRiver);
        System.out.println("GOLES boca de local:= "+ golesBoque);
    }
    
    public static int cargarVector(Partido[] v){
        int df = 20, i = 0;
                Partido p = new Partido();
        //leerPartidoTecla(p); //leemos por teclado
        leerPartidoAuto(p);
        while ((i < df) && (!p.getVisitante().toUpperCase().equals("ZZZ"))) {
            v[i++] = p;
            p = new Partido();
            //leerPartidoTecla(p);
            leerPartidoAuto(p);
        }
        return i;
    }
    public static void verPartido(Partido[] p, int dl) {
        for (int i = 0; i < dl; i++) {
            System.out.println((i+1)+")"+p[i]);
            }
    }  
    
    public static void leerPartidoTecla(Partido p) {
        p.setVisitante(PaqueteLectura.Lector.leerString());
        if (!p.getVisitante().toUpperCase().equals("ZZZ")) {
            p.setLocal(Lector.leerString());
            p.setGolesLocal(Lector.leerInt());
            p.setGolesVisitante(Lector.leerInt());
        }
    }
    public static void leerPartidoAuto(Partido p) {
        //p.setVisitante(GeneradorAleatorio.generarString(3));
        p.setVisitante("river");
        if (!p.getVisitante().toUpperCase().equals("ZZZ")) {
            //p.setLocal(GeneradorAleatorio.generarString(3));
            p.setLocal("boca");
            p.setGolesLocal(GeneradorAleatorio.generarInt(5));
            p.setGolesVisitante(GeneradorAleatorio.generarInt(5));
        }
    }
}
