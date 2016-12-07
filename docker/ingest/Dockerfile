FROM anapsix/alpine-java:8 

ADD application.conf /application.conf
ADD kafkastreamsdemo.jar /kafkastreamsdemo.jar

CMD ["java","-cp","kafkastreamsdemo.jar","algocrat.kafkastreamsdemo.IngestApp"]

