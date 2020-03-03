FROM ubuntu:latest

RUN mkdir app

RUN apt-get update -y

RUN apt-get install openjdk-8-jre -y

RUN apt-get install python -y
RUN apt-get -y install ipython python-pip

RUN pip install jupyter

COPY src/ /app/ 

RUN chmod +x /app/start_app.sh

EXPOSE 8888

# VOLUME  "/data" 

CMD /app/start_app.sh