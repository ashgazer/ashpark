FROM ubuntu:latest

RUN mkdir app

RUN apt-get update -y

RUN apt-get -y  install openjdk-8-jre python ipython python-pip wget

RUN pip install jupyter

RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz && tar zxvf spark-2.4.5-bin-hadoop2.7.tgz && rm spark-2.4.5-bin-hadoop2.7.tgz

WORKDIR /app

COPY src/ /app/ 

EXPOSE 8888

EXPOSE 4040

RUN mkdir /root/.jupyter

COPY /config/jupyter_notebook_config.py /root/.jupyter/

COPY start_app.sh /start_app.sh

RUN chmod +x /start_app.sh

CMD /start_app.sh