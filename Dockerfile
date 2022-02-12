FROM node:9.3.0

LABEL maintainer="Ye Shu <ye.shu@hackinit.org>"

WORKDIR /code

COPY bower.json /code/
COPY app.json /code/
COPY .env.config /code/
COPY .bowerrc /code/
COPY package.json /code/
COPY package-lock.json /code/

# RUN npm config set registry https://registry.npmmirror.com

RUN npm install -g bower@1.8.8
RUN npm install -g gulp@3.9.1

# replace bcrypt
# RUN npm install bcrypt-nodejs --save

RUN npm install
RUN bower install --allow-root
RUN npm run config

COPY . /code/
EXPOSE 3000

CMD ["gulp", "server"]
