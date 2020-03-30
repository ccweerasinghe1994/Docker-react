FROM node as builder

WORKDIR /app

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . . 

RUN npm run build



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


 