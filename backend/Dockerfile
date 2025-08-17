FROM openjdk:25-jdk-bullseye
COPY target/book-store-app.jar book-store-app.jar
COPY wait-for-it.sh .
RUN chmod +x wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "mysql:3306", "--", "java", "-jar", "book-store-app.jar"]