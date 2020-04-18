FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . . 
COPY npm run build .

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
