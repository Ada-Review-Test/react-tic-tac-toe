FROM node:alpine

LABEL maintainer="chris@adadev.org"

RUN mkdir /app

WORKDIR /app

ARG SUBMISSION_SUBFOLDER
ADD $SUBMISSION_SUBFOLDER/package.json .
RUN yarn install  --verbose

# Add entire student fork (overwrites previously added files)
ADD $SUBMISSION_SUBFOLDER /app

# for Testing
# ADD . .

ADD ./test.sh .

RUN chmod +x test.sh
