#!/bin/bash

CURRENT_PATH=`pwd`
JAR_PATH=${CURRENT_PATH}/scala-example/target/sparkwordcount-1.0.1-SNAPSHOT.jar

DEMO_TEST_FILE=${CURRENT_PATH}/java-example/src/test/resources/loremipsum.txt

NUMBER=2

OUTPUT_DIR=${CURRENT_PATH}/scala-output

SPARK_HOME=${CURRENT_PATH}/spark-1.3.0-bin-hadoop2.4
SPARK_MASTER=local


if [ -d "${OUTPUT_DIR}" ]; then
  echo "Directory ${OUTPUT_DIR} already exists..."
  echo "Please delete the directory ${OUTPUT_DIR} first..."
  echo "Use: rm -rf ${OUTPUT_DIR}"
  exit -1
fi

${SPARK_HOME}/bin/spark-submit --class org.zouzias.sparkwordcount.SparkWordCount --master ${SPARK_MASTER} ${JAR_PATH} ${DEMO_TEST_FILE} ${NUMBER}
