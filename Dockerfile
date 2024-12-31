# container to build app

FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# container to start nginx server based on my build

FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html

