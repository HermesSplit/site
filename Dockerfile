FROM node:22.19.0-alpine  AS builder
WORKDIR /app
# Install dependencies and build the project
RUN npm install @angular/cli
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 4200
CMD ["./node_modules/.bin/ng", "serve", "--host", "0.0.0.0"]
