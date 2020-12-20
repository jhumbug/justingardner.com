FROM node:14-alpine

RUN set -ex; \
    apk add --no-cache bash procps && \
    mkdir -p /usr/local/justingardner && \
    chown -R node:node /usr/local/justingardner

WORKDIR /usr/local/justingardner
USER node

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

WORKDIR /usr/local/justingardner/app
COPY . .

ARG PORT=3000
EXPOSE $PORT 9229
ENV NODE_ENV=development \
    PATH=/usr/local/justingardner/node_modules/.bin:$PATH \
    PORT=$PORT

CMD [ "next", "-p", "$PORT" ]
