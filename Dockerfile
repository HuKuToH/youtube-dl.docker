
FROM public.ecr.aws/lambda/python:3.8
FROM ubuntu:20.10

RUN apt-get -y update && \
    apt-get install -y git build-essential libssl-dev libffi-dev python3-dev


RUN git clone https://github.com/HuKuToH/youtube-dl  && \
    cd youtube-dl/ && \
    python3 setup.py build && \
    python3 setup.py install && \
    cd .. && \
    rm -r youtube-dl

ENTRYPOINT ["youtube-dl"]
