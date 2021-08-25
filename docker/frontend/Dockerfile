FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY frontend/package.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY frontend ./
COPY scripts/ /scripts/

# Save production build
RUN npm run build && \
    npm install -g serve && \
    mv build prod-build

# start app
CMD ["/bin/sh", "/scripts/fe_run.sh"]
