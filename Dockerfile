# Taken from https://lostechies.com/andrewsiemer/2016/04/14/building-a-slack-bot-with-botkit-node-and-docker/
FROM node:argon

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install node modules
COPY package.json /usr/src/app/
RUN npm --no-color install
# Install iced coffee with -g so we can call it later
RUN npm --no-color -g install iced-coffee-script

# Build js files
COPY *.coffee /usr/src/app/
RUN iced -c *.coffee

#set startup commands
CMD ["node", "r2d7.js"]
