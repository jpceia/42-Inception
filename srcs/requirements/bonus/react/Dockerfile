FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget git npm

RUN npm cache clean -f
RUN npm install -g n
RUN n latest
RUN npm i npm@latest -g
#RUN npm -g install create-react-app@3.4.1
#RUN create-react-app app --scripts-version 3.1.1
RUN npm -g install create-react-app
RUN create-react-app app
WORKDIR /root/app
RUN touch .npmignore
#COPY src/App.js src/App.js

CMD [ "npm", "start" ]
