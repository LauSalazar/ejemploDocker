FROM node:6.14-alpine
LABEL mainteiner="laurasalazarh@gmail.com"
EXPOSE 3000
RUN apk add --no-cache tini
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
COPY . /usr/src/app
RUN npm install /usr/src/app
RUN npm cache clean --force
ENTRYPOINT ["/sbin/tini", "-s"]
CMD node ./bin/www



