FROM ubuntu:20.04 AS hub_web

WORKDIR /app

RUN apt-get update && \
    apt-get install -y cron curl at

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

ENV NODE_VERSION=18.17.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN npm install dotenv

COPY package*.json ./
COPY prisma ./prisma/

COPY . .

RUN npm install
RUN npm run build
RUN npx prisma generate

EXPOSE 3000

CMD ["npm", "run", "start:prod"]