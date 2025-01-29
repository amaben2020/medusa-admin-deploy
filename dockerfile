# Current LTS Node
FROM node:22
WORKDIR /app
# Node dependencies
COPY crm/package.json .
COPY crm/yarn.lock .
RUN yarn install
# Copy remaining content of crm to /app
COPY crm/ .
# https://docs.medusajs.com/resources/medusa-cli/commands/build#run-built-medusa-application
RUN yarn build
WORKDIR /app/.medusa/server
RUN yarn install
ENV NODE_ENV=production
CMD ["yarn", "start"]