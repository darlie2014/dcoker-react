FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# the build folder will be created relative to the working directory resulting in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
