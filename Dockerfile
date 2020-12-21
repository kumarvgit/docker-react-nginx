FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .
RUN npm run build


# each from terminates previous section
FROM nginx

COPY --from=builder /app/build  /usr/share/nginx/html
