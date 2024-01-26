FROM nginx:stable-alpine

ARG WEB_FILE
ARG WIN_FILE_NAME
ARG AND_FILE_NAME

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/templates/nginx.conf.template

COPY ${WEB_FILE} /usr/share/nginx/html/
RUN echo "WIN_CLIENT_DOWNLOAD_PATH=/download/windows" > /usr/share/nginx/html/assets/.env
RUN echo "AND_CLIENT_DOWNLOAD_PATH=/download/android" >> /usr/share/nginx/html/assets/.env

COPY ${WIN_FILE_NAME} /download/${WIN_FILE_NAME}
COPY ${AND_FILE_NAME} /download/${AND_FILE_NAME}

ENV WIN_FILE_NAME=${WIN_FILE_NAME}
ENV AND_FILE_NAME=${AND_FILE_NAME}

WORKDIR /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]