FROM openjdk:17
EXPOSE 8085
ADD target/ExamenFinal-0.0.1-SNAPSHOT.jar  examenfinal.jar
ENTRYPOINT ["java","-jar","/examenfinal.jar"]