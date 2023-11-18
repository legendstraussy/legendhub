FROM ubuntu:20.04 AS hub_cron

WORKDIR /app

RUN apt-get update && \
    apt-get install -y cron curl at

ENV NODE_VERSION=18.17.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# RUN node --version
# RUN npm --version

RUN npm install mysql2 dotenv mysqldump

RUN mkdir /app/logs

COPY crontab.txt /app
COPY backup.sh /app
COPY backup.js /app
COPY package.json /app
COPY .env /app

# COPY init.sh /app
# COPY test.py /app
# COPY test.js /app

# RUN ["chmod", "+x", "/app/init.sh"]
RUN ["chmod", "+x", "/app/backup.sh"]

RUN crontab /app/crontab.txt

CMD ["cron", "-f"]