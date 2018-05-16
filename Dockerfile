FROM alpine:3.7

COPY ./entrypoint.sh /usr/local/bin/entrypoint

RUN apk --no-cache add \
    # Install NodeJS:
    nodejs \
    # Install ffmpeg for video recording:
    ffmpeg \
  \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch@'<1.0' \
  \
  && rm -rf \
    /tmp/* \
    /root/.npm \
  \
  \
  && chmod +x /usr/local/bin/entrypoint

WORKDIR /home/node

ENTRYPOINT ["entrypoint"]
