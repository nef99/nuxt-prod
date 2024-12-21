# Usar una imagen base oficial de Node
FROM node:18-alpine AS build-stage

# Crear y configurar el directorio de la aplicación
WORKDIR /app

# Copiar los archivos del proyecto
COPY . .

# Instalar las dependencias
RUN npm install --production

# Construir el proyecto Nuxt
RUN npm run build && npm run generate

FROM nginx:alpine AS production-stage

RUN rm -rf /usr/share/nginx/html/*

COPY ./nginx/default.conf /etc/nginx/conf.d

COPY --from=build-stage /app/dist /usr/share/nginx/html
# Exponer el puerto donde Nuxt escucha
EXPOSE 80

# Comando para ejecutar la aplicación
CMD ["nginx", "-g", "daemon off;"]


