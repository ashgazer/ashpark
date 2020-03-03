#!/bin/bash


# /app/spark-2.4.5-bin-hadoop2.6/bin/pyspark &
export SPARK_HOME=/app/spark-2.4.5-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --ip="0.0.0.0" --allow-root'

# jupyter notebook --ip="0.0.0.0" --allow-root &

cd /app
pyspark 