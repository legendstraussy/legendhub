FROM ubuntu:20.04 AS hub_cron

WORKDIR /app

RUN apt-get update && \
    apt-get install -y cron python3

COPY crontab.txt /opt
COPY init.sh /app
COPY test.py /app

RUN ["chmod", "+x", "/app/init.sh"]

RUN crontab /opt/crontab.txt

CMD ["cron", "-f"]