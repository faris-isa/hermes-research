FROM node:22-slim AS build
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm ci
# Initialize plugins first (creates .quartz/plugins)
RUN npx quartz create --template default --strategy new --links shortest --baseUrl quartz.jzhao.xyz
# Now copy actual content (overwrites the default "Welcome to Quartz")
COPY . .
RUN npx quartz build

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
RUN printf "server {\n  listen 8080;\n  location / {\n    root /usr/share/nginx/html;\n    index index.html index.htm;\n    try_files \$uri \$uri/ /index.html;\n  }\n}\n" > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
