FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .
RUN npm run build


# each from terminates previous section
FROM nginx
# expose a port, specfix to AWS Elastic bean stalk
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html
