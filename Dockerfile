FROM easypi/alpine-arm:3.8
RUN apk add --no-cache libc6-compat \
    && apk update --no-cache openssl
COPY ./libmosquitto.so.1 ./librtdb.so /lib/
COPY ./hrt2201 /home/ 
ENTRYPOINT ["/home/hrt2201"]



