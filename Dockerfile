FROM node:18.18.2

RUN npm install -g npm@latest

# Create app directory
RUN mkdir -p /app
WORKDIR /app

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