#!/bin/bash

sbt kafkastreamsdemo/assembly

cp application.conf docker/ingest/application.conf
cp kafkastreamsdemo/target/scala-2.11/kafkastreamsdemo.jar docker/ingest/kafkastreamsdemo.jar

cp application.conf docker/aggregation/application.conf
cp kafkastreamsdemo/target/scala-2.11/kafkastreamsdemo.jar docker/aggregation/kafkastreamsdemo.jar

docker rm kafkastreamsdemo_ingest
docker rm kafkastreamsdemo_aggregation
docker rm kafkastreamsdemo_kafka
docker rm kafkastreamsdemo_zookeeper

docker rmi -f kafkastreamsdemo_ingest
docker rmi -f kafkastreamsdemo_aggregation

cd docker/ingest; docker build --no-cache -t kafkastreamsdemo_ingest .; cd -
cd docker/aggregation; docker build --no-cache -t kafkastreamsdemo_aggregation .; cd -

docker-compose up --force-recreate
