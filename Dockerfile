FROM openjdk:latest

ENV PATH=$PATH:/gs-spring-boot/initial/
ENV PATH=$PATH:/opt/gradle/gradle-4.9/bin/

RUN mkdir /opt/gradle

RUN apt-get install git -y \
    && git clone https://github.com/spring-guides/gs-spring-boot.git \
    && ./gs-spring-boot/initial/gradlew

RUN wget https://services.gradle.org/distributions/gradle-4.9-bin.zip -P /opt/gradle/

RUN unzip -d /opt/gradle gradle-4.9-bin.zip

WORKDIR codigo_da_aplicacao

CMD gradle build && gradle sonarqube \
  -Dsonar.organization=renatoadsumus-github \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=4c14dff26c13dacf1fcfa88911b2f28bdafb0bca