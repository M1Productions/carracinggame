
echo OFF
echo ..Kompilieren..............................................
javac -cp .;.\lib\core\library\core.jar.;.\lib\hsqldb\lib\hsqldb.jar -d .\bin src\*.java
pause
echo ..ausfuehren..............................................
java -cp .;.\lib\core\library\core.jar.;.\lib\hsqldb\lib\hsqldb.jar.;.\bin main
pause
main
