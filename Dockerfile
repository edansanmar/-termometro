# Define la imagen base
FROM openjdk:latest

# Crea un directorio de trabajo para la aplicación
WORKDIR termometro

# Copia el archivo jar de la aplicación al directorio de trabajo
COPY target/termometer-0.0.1-SNAPSHOT.jar.jar ./

# Expone el puerto en el que se ejecuta la aplicación
EXPOSE 3500

# Define el comando que se ejecuta al iniciar el contenedor
CMD ["java", "-jar", "termometer-0.0.1-SNAPSHOT.jar"]

 localhost:8080/job/tarea_4/build?token=codigofacilito