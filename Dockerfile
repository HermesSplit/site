FROM node:22.19.0-alpine  AS builder
WORKDIR /app
# Install dependencies and build the project
RUN npm install @angular/cli
COPY package*.json ./
RUN npm ci
COPY . .
# RUN node_modules/.bin/ng build
# FROM node:20-alpine AS runner
# WORKDIR /app
# COPY --from=builder /app/dist ./dist
# COPY --from=builder /app/package*.json ./
# RUN npm ci --only=production
# RUN npm install @angular/cli
EXPOSE 4200
CMD ["./node_modules/.bin/ng", "serve", "--host", "0.0.0.0"]
