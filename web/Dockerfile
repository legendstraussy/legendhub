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

# RUN node --version
# RUN npm --version

RUN npm install dotenv

RUN mkdir /app/logs

# Installing dependencies
COPY package*.json ./
COPY prisma ./prisma/

# Copying source files
COPY . .

RUN npx prisma generate

RUN npm install

# Building app
RUN npm run build

EXPOSE 3000

# Running the app
CMD ["npm", "run", "start:prod"]