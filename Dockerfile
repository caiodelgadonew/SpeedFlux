FROM    python:3.8-slim-buster
LABEL   maintainer="Caio Delgado" 
LABEL   description="Original by Aiden Gilmartin. Maintained by Caio Delgado"

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt-get update && \
        apt-get -q -y install --no-install-recommends \
        apt-utils \
        gnupg1 \
        apt-transport-https \
        dirmngr \
        curl \
        && curl -s https://install.speedtest.net/app/cli/install.deb.sh --output /opt/install.deb.sh \
        && bash /opt/install.deb.sh \
        && apt-get update && apt-get -q -y install speedtest \
        && rm /opt/install.deb.sh \ 
        && apt-get -q -y autoremove && apt-get -q -y clean \
        && rm -rf /var/lib/apt/lists/* 

ADD     . /app

WORKDIR /app

COPY    requirements.txt requirements.txt

RUN     pip install -r requirements.txt 

COPY    . .

CMD     ["python", "main.py"]
