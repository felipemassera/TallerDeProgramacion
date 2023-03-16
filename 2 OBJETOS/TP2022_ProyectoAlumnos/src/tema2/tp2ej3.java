package tema2;

public class tp2ej3 {
//Responda: ¿Qué imprimen los siguientes programas? ¿Qué efecto tiene la asignación 
//utilizada con objetos? ¿Qué efecto tiene la comparación con == y != utilizada con objetos?
//¿Qué retorna el mensaje equals cuando se le envía a un String?    

/*
 public static void main(String[] args) {
 String saludo1=new String("hola");
 String saludo2=new String("hola");
 System.out.println(saludo1 == saludo2); //FALSE: NO ESTAN APUNTANDO A LA MISMA DIRECCION DE MEMORIA
 System.out.println(saludo1 != saludo2); //TRUE: LO DE ARRIBA 
 System.out.println(saludo1.equals(saludo2));}} // TRUE: LOS DOS TIENEN "hola"COMO CONTENIDO DEL OBJETO
*/
  

 public static void main(String[] args) {
 Persona p1; 
 Persona p2;
 p1 = new Persona();
 p1.setNombre("Pablo Sotile");
 p1.setDNI(11200413);
 p1.setEdad(40);
 p2 = new Persona();
 p2.setNombre("Julio Toledo");
 p2.setDNI(22433516);
 p2.setEdad(51);
 p1 = p2;
 p1.setEdad( p1.getEdad() + 1 ); //DEBE SETEAR 52 EN LA EDAD YA Q= 51del set + 1;
 System.out.println(p2.toString()); //  NOMBRE: Julio toledo DNI: 22433516 EDAD: 52
 System.out.println(p1.toString());//  NOMBRE: Julio toledo DNI: 22433516 EDAD: 52 muestra lo mismo pues P1=P2 asigno a p1 lo que tenia p2
 System.out.println( (p1 == p2) );}} //TRUE: Ambos punteros referencian al mismo objeto

    
