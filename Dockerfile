FROM node:20-slim

WORKDIR /usr/src/app

COPY package*.json .

# RUN npm install --global yarn

COPY . .
RUN rm -rf ./chains

EXPOSE 3456
VOLUME [ "chains" ]

RUN yarn --ignore-engines

CMD [ "yarn", "serve", "--port", "3456", "--host" ]