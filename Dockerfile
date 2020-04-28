#config phase
#all is going to be refered as a builderp phase
FROM node:alpine as builder
#where all athe fiels will be stored and executed
WORKDIR '/app'
COPY package*.json .
#RUN will execute a command
RUN npm install
COPY . .
RUN npm run build

#secound phase

FROM nginx
#the expose instruction shows the port we should isten on
#aws elasticbs reads it and exposed the port
EXPOSE 80
# what we wish to copy from previous phase
COPY --from=builder /app/build /usr/share/nginx/html
