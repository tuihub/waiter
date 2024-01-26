FROM nginx:stable-alpine

ARG WEB_FILE
ARG WIN_FILE_NAME
ARG AND_FILE_NAME

RUN apk add --no-cache --update miller

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

COPY ${WEB_FILE} /usr/share/nginx/html
RUN touch /usr/share/nginx/html/.env
RUN echo "WIN_CLIENT_DOWNLOAD_PATH=/download/windows" > /usr/share/nginx/html/.env
RUN echo "AND_CLIENT_DOWNLOAD_PATH=/download/android" >> /usr/share/nginx/html/.env

COPY ${WIN_FILE_NAME} /download/${WIN_FILE_NAME}
COPY ${AND_FILE_NAME} /download/${AND_FILE_NAME}

RUN apk del miller

ENV WIN_FILE_NAME=${WIN_FILE_NAME}
ENV AND_FILE_NAME=${AND_FILE_NAME}

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]