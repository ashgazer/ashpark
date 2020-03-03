FROM ubuntu:latest

RUN mkdir app

RUN apt-get update -y

RUN apt-get -y  install openjdk-8-jre python ipython python-pip wget

RUN pip install jupyter

WORKDIR /app

RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz && tar zxvf spark-2.4.5-bin-hadoop2.7.tgz && rm spark-2.4.5-bin-hadoop2.7.tgz

COPY src/ /app/ 

RUN chmod +x /app/start_app.sh

EXPOSE 8888

# VOLUME  "/data" 

RUN mkdir /root/.jupyter
COPY jupyter_notebook_config.py /root/.jupyter/

CMD /app/start_app.sh