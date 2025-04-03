From tomcat:9 
MAINTAINER "Kosmik"
COPY ./tweet-trend/target/tweet-trend-1.0.1.war /usr/local/tomcat/webapps
EXPOSE 8080