# Taking Node Version 16 as a base Image
FROM node:16

# Installing pm2 globally
RUN npm install pm2 -g

# Creating work directory
WORKDIR /app

# Copying files from local to Container Work Directory folder 
COPY *.js* /app/

# Copying public folder to Container Work Directory folder
COPY public /app/public/

# Executing below commands to bring the service up
RUN npm init -y
RUN npm i express.js body-parser knex pg nodemon

# Exposing port 3000
EXPOSE 3000

# Executing command using CMD
CMD ["pm2-runtime", "portal-app.js"]
