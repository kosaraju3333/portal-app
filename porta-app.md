# portal-app Service
Docker build command with ARGS
* ```ARG variables are temporary, used only during building docker image.```

  * `docker image build --build-arg listen_PORT="5000" --build-arg HOST="host_value" --build-arg PORT=5432 --build-arg USER="user_value"
 --build-arg PASSWORD="password_value" --build-arg DATABASE="database_value" -t name_of_image .`

Docker run command with env variables
* ```ENV variables are persistent, we can access the ENV variables inside of the container.```

  * `docker run -id -p 3000:3000 -e HOST='host_value' -e PORT='5432' -e USER='user_value' -e PASSWORD='password_value' -e DATABASE='database_value' --name conatainer_name docker_image_name:Version`

Docker run command with --env-file variables
  * `docker run -id -p 3000:3000 --env-file name_of_env_file --name container_name docker_image_name:Version`

Docker command to login to container
  * `docker exec -it container_id /bin/bash`

WRK- a HTTP benchmarcking Tool where we can genarate a load on pods.
 1: Install WRK in pod
  * `apk add wrk`
 2: Now Generate a load to endpoint using below comand
  * `wrk -c 5 -t 5 -d 300s -H "Connection: Close" http://SERVICE_NAME:PORT_NUMBER`

 brew install wrk        # macOS
 * `sudo apt install wrk`    # Ubuntu (or build from source)
 # 10 threads, 10 connections, 30 seconds duration
 * `wrk -t10 -c10 -d30s https://your-url.com`


```docker run -id -p 3000:3000 --network portal-app-net -e HOST='postgresdb' -e PORT='5432' -e USER='postgres' -e PASSWORD:'postgres' -e DATABASE:'spontan' -e listen_PORT=3000 --name portal-app kosaraju333/portal-spontan-arg-env_1:V1```

WRK- a HTTP benchmarcking Tool where we can genarate a load on pods.

brew install wrk        # macOS
sudo apt install wrk    # Ubuntu (or build from source)

# 10 threads, 10 connections, 30 seconds duration
wrk -t10 -c10 -d30s https://your-url.com

