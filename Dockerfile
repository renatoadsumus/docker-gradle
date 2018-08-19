FROM openjdk:latest

ENV PATH=$PATH:/gs-spring-boot/initial/

RUN apt-get install git -y \
    && git clone https://github.com/spring-guides/gs-spring-boot.git \
    && ./gs-spring-boot/initial/gradlew

WORKDIR codigo_da_aplicacao

CMD gradlew build && gradlew sonarqube \
  -Dsonar.organization=renatoadsumus-github \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=4c14dff26c13dacf1fcfa88911b2f28bdafb0bca