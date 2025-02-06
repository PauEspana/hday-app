javac -d . app/*.java
jar cvmf MANIFEST.MF hday.jar -C . app/*.class
