FROM easypi/alpine-arm:3.8
RUN apk add --no-cache libc6-compat \
    && apk update --no-cache openssl \
    && apk add --no-cache libstdc++
COPY ./libmosquitto.so.1 ./librtdb.so /lib/



