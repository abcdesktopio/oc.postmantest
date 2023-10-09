ARG TARGETPLATFORM
ARG BUILDPLATFORM
# Default release is 22.04
ARG TAG=latest
# Default base image 
ARG BASE_IMAGE=ubuntu
# BASE_IMAGE_RELEASE deprecated
ARG BASE_IMAGE_RELEASE=22.04

FROM ${BASE_IMAGE}:${TAG} 
ENV NODE_MAJOR=18

# to make install wmctrljs nodejs components
# add build dev package 
RUN apt-get update && apt-get install -y  --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        dpkg

# install newman npm nodejs 
RUN  mkdir -p /etc/apt/keyrings && \
     curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
     echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && apt-get update && apt-get install -y --no-install-recommends nodejs && npm -g install newman

COPY /postman-collections /postman-collections
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD /docker-entrypoint.sh
