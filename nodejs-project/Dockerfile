FROM google/nodejs

maintainer curry zuoyuchu@gmail.com

WORKDIR /app
ADD package.json /app/
RUN npm install
ADD . /app

CMD []
ENTRYPOINT ["/nodejs/bin/npm", "start"]

EXPOSE 3000
