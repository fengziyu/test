FROM node as build
WORKDIR /app
COPY package.json yarn.lock /app/
COPY /data/traefik/.yar-cache /.yarn-cache
RUN yarn config set cache-folder /.yarn-cache && yarn
COPY . .
RUN yarn build

FROM nginx:alpine
EXPOSE 80
WORKDIR /
COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /app/default.conf /etc/nginx/conf.d
