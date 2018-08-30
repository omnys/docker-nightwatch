FROM alpine:3.7

COPY ./entrypoint.sh /usr/local/bin/entrypoint

RUN apk --no-cache add \
    # Install NodeJS:
    nodejs \
    # Install jre:
    openjdk7-jre \
    # Install ffmpeg for video recording:
    ffmpeg \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch@'<1.0' \
  && npm install selenium-standalone@latest -g \
  && selenium-standalone install \
  && rm -rf \
    /tmp/* \
    /root/.npm \
  && chmod +x /usr/local/bin/entrypoint

RUN adduser -D -u 1000 node

USER node

WORKDIR /home/node

ENTRYPOINT ["entrypoint"]
