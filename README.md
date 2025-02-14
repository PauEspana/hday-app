# APLICACIÓ JAVA

Recorda que el codi Java es pot llegir quan s'hi té accés. Si el fitxer `app/Quiz.java` cau en mans equivocades es podrà llegir la contrasenya i accedir a la base de dades. En canvi, el fitxer `hday.jar` serà un fitxer compilat i serà més difícil llegir-lo.
Aquest programa té una dependència `mysql-connector`, si volem moure el fitxer `hday.jar` caldrà copiar-ne també la carpeta `lib` amb la mateixa forma relativa.


## Compilar i crear JAR
```bash
chmod +x build.sh
./build.sh
```

## Executar 
```bash
java -jar hday.jar
```

## Base de dades

Aquest programa requereix una base de dades de mysql. 
Per modificar l'usuari i la contrasenya, modificar en el fitxer `app/Quiz.java` les 3 següents línies:
```java
static final String DATABASE_STRING = "jdbc:mysql://IP_DATABASE:PORT_DATABASE";
static final String DATABASE_USER = "USER";
static final String DATABASE_PASSWORD = "PASSWORD";
```

Un cop modificades les constants amb les correctes per connectar-se a la seva base de dades, el primer cop que inici l'aplicació, es generarà automàticament la base de dades utilitzant el fitxer `init.sql`
Si es vol modificar la base de dades, modifiqueu el fitxer prèviament anomenat.