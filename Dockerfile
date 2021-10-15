FROM python:3

WORKDIR /usr/src/app

COPY ./run.sh .
COPY ./conf/* .
RUN apt-get update &&\
    apt-get install -y expect 

CMD [ "bash", "./run.sh" ]
