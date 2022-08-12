#FROM registry.access.redhat.com/ubi8/nodejs-16:latest
FROM node:10

# change working dir
WORKDIR "/app"

# update package and install deps
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean \
 && echo 'Finished update'


# Copy package.json and package-lock.json
COPY package*.json ./

# Install npm production packages 
RUN npm install 

COPY . /app


EXPOSE 3000

CMD ["npm", "start"]
