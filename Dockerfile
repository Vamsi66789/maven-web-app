FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
workdir /app
COPY --from=build /app/target/01-maven-web-app.war /app/
EXPOSE 9090
CMD [ "java","-war","01-maven-web-app.war" ]
