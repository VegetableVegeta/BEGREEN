FROM node:16

WORKDIR /root
RUN npx create-react-app app


RUN rm -rf /root/app/package.json
RUN rm -rf /root/app/package-lock.json
RUN rm -rf /root/app/.gitignore
RUN rm -rf /root/app/README.md

RUN rm -rfv /root/app/public 
RUN rm -rfv /root/app/src

COPY package-lock.json /root/app
COPY package.json /root/app
COPY .gitignore /root/app
COPY README.md /root/app

RUN mkdir /root/app/public
WORKDIR /root/app/public
COPY public /root/app/public

RUN mkdir /root/app/src
WORKDIR /root/app/src
COPY src /root/app/src

WORKDIR /root/app

# RUN git init
RUN npm i

