# see: https://nodejs.org/ja/docs/guides/nodejs-docker-webapp/
FROM node:12

ENV APP_ROOT=/usr/src/app

WORKDIR ${APP_ROOT}

COPY ./app/nodejs/package*.json ./

RUN npm install
COPY ./app/nodejs/index.js ${APP_ROOT}

CMD [ "node", "index.js" ]
