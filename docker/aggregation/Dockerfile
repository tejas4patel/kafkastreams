FROM anapsix/alpine-java

ADD application.conf /application.conf
ADD kafkastreamsdemo.jar /kafkastreamsdemo.jar

CMD ["java","-cp","kafkastreamsdemo.jar","algocrat.kafkastreamsdemo.AggregationApp"]

