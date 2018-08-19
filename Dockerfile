FROM openjdk:latest

ENV PATH=$PATH:/gs-spring-boot/initial/

RUN apt-get install git -y \
    && git clone https://github.com/spring-guides/gs-spring-boot.git \
    && ./gs-spring-boot/initial/gradlew

COPY run_sonar.sh /opt/run_sonar.sh

RUN chmod +x /opt/run_sonar.sh

WORKDIR codigo_da_aplicacao

#CMD ["/opt/run_sonar.sh"]

CMD ["gradlew", "build","/opt/run_sonar.sh"]