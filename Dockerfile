# Define la imagen base
FROM maven:3.9.5-openjdk-11 AS builder

# Establece el directorio de trabajo para la etapa de compilación
WORKDIR /termometro

# Copia los archivos del repositorio al directorio de trabajo en el contenedor
COPY . .

# Compila la aplicación utilizando Maven
RUN mvn clean package

# Cambia a una nueva etapa utilizando la imagen base de ejecución
FROM openjdk:11-jdk

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /termometro

# Copia el archivo jar de la aplicación al directorio de trabajo
COPY --from=builder /termometro/target/termometer-0.0.1-SNAPSHOT.jar ./

# Expone el puerto en el que se ejecuta la aplicación
EXPOSE 3500

# Define el comando que se ejecuta al iniciar el contenedor
CMD ["java", "-jar", "termometer-0.0.1-SNAPSHOT.jar"]
