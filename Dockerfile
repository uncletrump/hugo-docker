FROM alpine:latest
MAINTAINER Bing Wang <mail.ouhei@gmail.com>

ENV HUGO_VERSION=0.58.3

# Install Hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp
RUN apk add --no-cache py-pygments ca-certificates \
    && cd /tmp \
    && tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && cd / \
    && hugo new site blog

# Decide working directory
WORKDIR /blog

# Mount volume to host
VOLUME /blog

# Expose default hugo port
EXPOSE 1313

# By default, serve site
CMD hugo server \
    --bind 0.0.0.0 \
    --navigateToChanged \
    --templateMetrics \
    --buildDrafts \
    -w
