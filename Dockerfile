
FROM nginx:alpine

LABEL maintainer="devops-practice"
LABEL environment="production"

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
