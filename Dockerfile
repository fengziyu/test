FROM node:13.10.1
WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn
COPY . .
RUN yarn build

FROM nginx:alpine
EXPOSE 80
WORKDIR /
COPY /app/dist /usr/share/nginx/html
COPY /app/default.conf /etc/nginx/conf.d
