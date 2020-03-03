FROM ubuntu:latest

RUN mkdir app

RUN apt-get update -y

RUN apt-get -y  install openjdk-8-jre python ipython python-pip wget

RUN pip install jupyter

WORKDIR /app

RUN wget https://www.apache.org/dyn/closer.lua/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz && tar zxvpf spark-2.4.5-bin-hadoop2.7.tgz && rm spark-2.4.5-bin-hadoop2.7.tgz

COPY src/ /app/ 

RUN chmod +x /app/start_app.sh

EXPOSE 8888

# VOLUME  "/data" 

CMD /app/start_app.sh