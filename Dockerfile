FROM openjdk:17.0.12
RUN apt-get install -y unzip
ENV APP_HOME=/root/dev/beverage
WORKDIR /app
RUN curl -L https://services.gradle.org/distributions/gradle-7.3-bin.zip -o gradle-7.3-bin.zip
RUN unzip gradle-7.3-bin.zip
ENV GRADLE_HOME=/app/gradle-7.3
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version

ADD ./src src
ADD ./gradle/wrapper gradle/wrapper
ADD ./build.gradle   build.gradle
ADD ./gradlew gradlew
ADD ./gradlew.bat gradlew.bat
ADD ./settings.gradle    settings.gradle

RUN gradle clean build

EXPOSE 9091
CMD ["java", "-jar", "build/libs/log-aggr-account-0.0.1-SNAPSHOT.jar","--spring.config.location=/etc/properties/application.properties"]