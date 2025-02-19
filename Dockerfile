FROM node:14-alpine
LABEL maintainer "chaithu"
WORKDIR /chaithu
COPY ./package*.json  ./
RUN npm i
copy . .
RUN npm run build
CMD ["npm","start"]
EXPOSE 3000

