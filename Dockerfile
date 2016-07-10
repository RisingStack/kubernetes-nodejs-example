FROM risingstack/alpine:3.4-v4.4.4-3.6.1

ARG NPM_TOKEN
ENV PORT 3001

EXPOSE 3001

# Install dependencies first, add code later: docker is caching by layers
COPY .npmrc .npmrc
COPY package.json package.json

# Docker base image is already NODE_ENV=production
RUN npm install

# Add your source files
COPY . .

RUN rm -f .npmrc

# Silent start because we want to have our log format as the first log
CMD ["npm", "start", "-s"]
