FROM node:lts-alpine3.20

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -f

COPY . .

RUN npm run test

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]
