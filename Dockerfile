FROM node:22-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npx quartz create --template default --strategy copy --links shortest --baseUrl quartz.jzhao.xyz
RUN npx quartz build

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
RUN printf "server {\n  listen 8080;\n  location / {\n    root /usr/share/nginx/html;\n    index index.html index.htm;\n    try_files \$uri \$uri/ /index.html;\n  }\n}\n" > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
