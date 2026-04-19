FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

<<<<<<< HEAD
# Copy built files
COPY . /usr/share/nginx/html
=======
COPY Trend/dist/ /usr/share/nginx/html/
>>>>>>> ee54f22 (fix: docker and nginx deployment working)

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
