FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run test

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]
