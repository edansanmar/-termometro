#Se utiliza el from, para indincar las imagenes base que se utilizaran, para realizar
#La siguiente imagen, en este caso se utilizara una de maven y una de openjdk
#Cabe adicionar que en este caso la imagen base dera maven y se complementara
#con el jdk 11, además esta parte sera conocida como builder.
FROM maven:3.9.5-openjdk-11 AS builder

#Se procede a definir la tura en donde se creara el directorio de trabajo 
#de la imagen que se creara.
WORKDIR /termometro

# Copia el archivo JAR generado por la compilación al directorio de trabajo en el contenedor
COPY --from=builder /crudspringboot/target/*.jar app.jar

# Expone el puerto 3000 del contenedor
EXPOSE 3030

# Comando de entrada para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]