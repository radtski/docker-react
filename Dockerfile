FROM node:16-alpine3.12 as builder

WORKDIR '/app'

COPY package.json .
#RUN chown -R node.node /app
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html


