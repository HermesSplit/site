FROM node:22.19.0-alpine  AS builder
WORKDIR /app
# Install dependencies and build the project
RUN npm install -g @angular/cli
COPY package*.json ./
RUN npm ci
COPY . .
RUN ng build
FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
RUN npm ci --only=production
EXPOSE 4000
CMD ["node", "dist/server/main.js"]
