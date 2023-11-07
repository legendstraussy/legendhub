FROM ubuntu:20.04 AS hub_cron

RUN apt-get update && \
    apt-get install -y cron

COPY crontab.txt /opt

RUN crontab /opt/crontab.txt

CMD ["cron", "-f"]