FROM node:14.20.0-alpine3.16
RUN apk add --update --no-cache \
    python3 \
    make \
    g++ \
    git \
    bash
WORKDIR /workspace
COPY . /workspace/
RUN npm install --production
CMD ["node", "./index.js"]
