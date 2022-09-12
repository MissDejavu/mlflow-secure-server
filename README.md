# mlflow-secure-server
A basic docker-compose setup for running a secure mlflow tracking server with PostgreSQL and MinIO storage.

Contains three services: 
- mlflowserver: contains the mlflow tracking server, depends on db and minio services
- db: a postgresql database used as tracking storage
- minio: s3 like bucket used as artifact store
- nginx: to restrict access to the mlflow server

## Setup

Configure the server with the arguments specified in the .env file:

- MINIO_DIR: the path to the directory where the minio data will be stored.

- DATABASE_DIR: the path to the directory where the database will be stored.

- MINIO_ROOT_USER: the username for the root access to minio.

- MINIO_ROOT_PASSWORD: the password for root access to minio.

- AWS_ACCESS_KEY_ID: S3 user credentials (access id) required by the clients.

- AWS_SECRET_ACCESS_KEY: S3 user credentials (secret key) required by the clients.

- POSTGRES_USER: username for the database.

- POSTGRES_PASSWORD: password for the database.

- MINIO_HOST: name of the minio service.

- MLFLOW_TRACKING_USERNAME: username for accessing the mlflow UI via nginx.

- MLFLOW_TRACKING_PASSWORD: password for accessing the mlflow UI via nginx.


First time setup requires to configure the MinIO S3 storage. After running `docker-compose up -d --build` in a web browser go to [localhost:9100](localhost:9100). The minio login page should be 
visible. Login with the root credentials and then:
- create a bucket called `mlflow` (if you want to change the name make sure to change it in the docker-compose as well)
- create a user with access-key and secret-key and provide both to any clients who should be allowed to save experiments on the mlflow server


## Run 

Run with `docker-compose up -d`. 
For first time run include `--build` to build and then start the mlflow tracking server: `docker-compose up -d --build`.

See logs of one of the services with `docker-compose logs mlflowserver`.

Shut down with `docker-compose down`. 

## Tracking UI 

The tracking server UI is running by default on port 5000.
