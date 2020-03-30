FROM node:13.8.0-alpine AS build
ENV NODE_ENV=production
WORKDIR /app

COPY package*.json ./

RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm i --quiet \
    && npm audit fix \
    && apk del build-dependencies

COPY . .

EXPOSE 3000
CMD npm run start