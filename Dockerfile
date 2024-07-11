FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -f

COPY . .

RUN npm run test || (npm cache clean --force && rm -rf node_modules && npm install -f)

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]
