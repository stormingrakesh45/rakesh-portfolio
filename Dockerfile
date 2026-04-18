FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

# Copy EVERYTHING (html, css, js, images)
COPY . /usr/share/nginx/html/

EXPOSE 80