#
#Building app
#

########################################
FROM node:alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build
# /app/build - output folder

#
#Another container with NGNIX
#
########################################
FROM nginx AS runphase
COPY --from=builder /app/build /usr/share/nginx/html

