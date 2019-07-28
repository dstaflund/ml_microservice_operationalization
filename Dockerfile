FROM python:3.7.3-stretch

LABEL maintainer="d.staflund@gmail.com"
LABEL institution="Udacity"
LABEL nanodegree="Cloud DevOps Engineer Nanodegree Program"
LABEL lesson="Microservices at Scale using AWS and Kubernetes"
LABEL project="Operationalize a Machine Learning Microservice API"

WORKDIR /app

COPY ./app.py /app/
COPY ./model_data/* /app/model_data/
COPY ./requirements.txt /app/

RUN pip install --upgrade pip==19.2.1 &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80/tcp

CMD [ "python", "app.py" ]

