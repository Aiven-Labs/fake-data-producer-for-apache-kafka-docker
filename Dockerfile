FROM python:3

WORKDIR /usr/src/app

COPY ./run.sh .
COPY ./conf ./conf
RUN apt-get update &&\
    apt-get install -y expect &&\
    apt-get install -y jq

CMD [ "bash", "./run.sh" ]
