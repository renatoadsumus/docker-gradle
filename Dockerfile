FROM openjdk:latest

ENV PATH=$PATH:/gs-spring-boot/initial/

RUN apt-get install git -y \
    && git clone https://github.com/spring-guides/gs-spring-boot.git \
    && ./gs-spring-boot/initial/gradlew

RUN mkdir /opt/codigo_da_aplicacao

COPY run_sonar.sh /opt/codigo_da_aplicacao/run_sonar.sh

RUN chmod +x /opt/codigo_da_aplicacao/run_sonar.sh

WORKDIR /opt/codigo_da_aplicacao

#CMD ["/codigo_da_aplicacao/run_sonar.sh"]

CMD ["gradlew", "build","run_sonar.sh"]