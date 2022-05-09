FROM node:16

RUN mkdir /root/app
WORKDIR /root/app
RUN git init

COPY .env /root/app/
COPY . .

RUN npm init -y
RUN npm install
