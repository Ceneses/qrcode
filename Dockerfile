FROM node:16.17.0
WORKDIR /usr/src/app
RUN npm install -g serve
COPY package.json package-lock.json ./
RUN npm install && npm cache clean
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "npm", "run start" ]