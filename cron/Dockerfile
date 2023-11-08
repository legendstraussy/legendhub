FROM ubuntu:20.04 AS hub_cron

WORKDIR /app

RUN apt-get update && \
    apt-get install -y cron python3

ENV NODE_VERSION=18.17.0

RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN node --version
RUN npm --version

RUN npm install mysql dotenv

RUN mkdir /logs


COPY crontab.txt /opt
COPY init.sh /app
COPY backup.sh /app
COPY test.py /app
COPY test.js /app

RUN ["chmod", "+x", "/app/init.sh"]
RUN ["chmod", "+x", "/app/backup.sh"]

RUN crontab /opt/crontab.txt

CMD ["cron", "-f"]