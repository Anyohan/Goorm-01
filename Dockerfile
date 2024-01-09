## 빌드 단계 진행
#FROM openjdk:17-ea-11-jdk-slim AS build
#WORKDIR /usr/src/app
#
## 빌드에 필요한 gradle 파일 COPY
#COPY build.gradle settings.gradle gradlew /usr/src/app/
#COPY gradle /usr/src/app/gradle
#RUN ./gradlew --version
#
## 소스코드 COPY
#COPY src /usr/src/app/src
#
## build 스프링
#RUN ./gradlew build
#
## 실제 jar 파일이 실행되는 런타임 이미지
#FROM openjdk:17-jre-slim-buster
#WORKDIR /usr/src/app
#
## 빌드된 jar 파일만 이미지화
#COPY --from=build /usr/src/app/build/libs/hello-Spring-0.0.1-SNAPSHOT.jar app.jar
#
#EXPOSE 8080
#
#CMD ["java", "-jar", "app.jar"]

# AdoptOpenJDK를 기본 이미지로 사용
FROM openjdk:17-ea-11-jdk-slim

# 작업 디렉터리 설정
WORKDIR /usr/src/app

# JAR 파일을 컨테이너로 복사
COPY build/libs/hello-Spring-0.0.1-SNAPSHOT.jar app.jar

# 애플리케이션이 실행될 포트 노출
EXPOSE 8080

# 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]