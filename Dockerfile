FROM node:22-slim AS build
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# Clone plugins from lock file (index.ts is already committed)
RUN bash scripts/init-plugins.sh
RUN node quartz/bootstrap-cli.mjs build

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
