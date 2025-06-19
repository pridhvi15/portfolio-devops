FROM node:24-alpine3.21 AS build

WORKDIR /app

COPY package*.json/ ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.27.5-alpine AS production

COPY --from=build /app/dist/ /usr/share/nginx/html/

EXPOSE 80