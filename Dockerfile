FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get -y update && apt-get install -y build-essential r-base python3 python3-pip python3-setuptools python3-dev

COPY requirements.txt /app/requirements.txt

RUN pip3 install --upgrade pip

RUN pip3 install -r requirements.txt

RUN pip3 install -U imbalanced-learn

RUN Rscript -e "install.packages('data.table')"

RUN Rscript -e "install.packages('ltm')"

RUN R -e "install.packages('ltm');     if (!library(ltm, logical.return=T)) quit(status=10)"