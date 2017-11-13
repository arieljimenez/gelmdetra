FROM frolvlad/alpine-glibc

RUN mkdir -p /app

RUN apk add --update --no-cache gcc \
                                nodejs-npm

RUN npm install -g elm

WORKDIR /app

EXPOSE 8000 8080

CMD sh /app/scripts/start.sh
