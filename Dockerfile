FROM    python:3.8-alpine
LABEL   maintainer="Caio Delgado" 
LABEL   description="Original by Aiden Gilmartin. Maintained by Caio Delgado"

RUN     apk add --no-cache speedtest-cli

ADD     . /app

WORKDIR /app

COPY    requirements.txt requirements.txt

RUN     pip install -r requirements.txt 

COPY    . .

CMD     ["python", "main.py"]
