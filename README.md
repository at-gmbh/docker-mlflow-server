# docker-mlflow-server

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/atcommons/mlflow-server)](https://hub.docker.com/r/atcommons/mlflow-server)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/atcommons/mlflow-server)](https://hub.docker.com/r/atcommons/mlflow-server)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/atcommons/mlflow-server)](https://hub.docker.com/r/atcommons/mlflow-server)
[![PyPI - License](https://img.shields.io/pypi/l/personio-py)](https://github.com/at-gmbh/personio-py/blob/master/LICENSE)

A docker image of [MLflow](https://github.com/mlflow/mlflow), more specifically the server component which provides [MLflow Tracking](https://mlflow.org/docs/latest/tracking.html), [MLflow Models](https://mlflow.org/docs/latest/models.html) and more.

## Supported Tags

* [latest](https://github.com/at-gmbh/docker-mlflow-server/blob/master/Dockerfile)
* [1.14.1](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.14.0/Dockerfile)
* [1.14.0](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.14.0/Dockerfile)
* [1.13.1](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.13.1/Dockerfile)
* [1.13](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.13/Dockerfile)
* [1.12.1](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.12.1/Dockerfile)
* [1.12](https://github.com/at-gmbh/docker-mlflow-server/blob/v1.12.0/Dockerfile)

These tags denote version numbers that correspond to the published versions of the [mlflow package on PyPI](https://pypi.org/project/mlflow/).

## How to use this image

You may run the docker image with

    docker run -it --rm -p 5000:5000 -v /local/path:/mlflow --name mlflow-server atcommons/mlflow-server

This will expose port 5000 of the container to the host system and mount the `/mlflow` folder from the container to `/local/path` for persistence (you should adapt this path to your needs).

Now the mlflow webserver should be available on [localhost:5000](http://localhost:5000/#/).

### Configuration

The mlflow instance can be configured through environment variables

* `BACKEND_URI`: Define the [backend store](https://mlflow.org/docs/latest/tracking.html#backend-stores) where experiments and all metadata are stored. You may provide a file path or a database URI. Defaults to a local sqlite database.
* `ARTIFACT_ROOT`: Define the root directory of mlflow's [artifact store](https://mlflow.org/docs/latest/tracking.html#artifact-stores). Note that serving of files in the artifact store is not managed by the mlflow server, so you have to provide a storage path that is accessible by the server as well as all clients. While using local paths is possible, it is not very useful in practice. Feasible backends are Amazon S3, Azure Blob Storage, Google Cloud Storage and more.

### docker-compose

For a better UX when handling all these parameters, please refer to the sample [`docker-compose.yml`](./docker-compose.yml) or adapt this code block to your needs:

```
version: '3'

services:
  mlflow:
    image: 'atcommons/mlflow-server'
    build: .
    ports:
      - "5000:5000"
    volumes:
      - "./data:/mlflow"
    environment:
      BACKEND_URI: sqlite:////mlflow/mlflow.db
      ARTIFACT_ROOT: /mlflow/artifacts
```

When you're happy with the configuration, just run

    docker-compose up -d

## Maintaining this Build

When a new version is released, please make a git commit with the modified version in the docker file and the corresponding tag with format "vx.x.x".

## Contact

Sebastian Straub (sebastian.straub [at] alexanderthamm.com)

Developed with ❤ at [Alexander Thamm GmbH](https://www.alexanderthamm.com/)

## License

    Copyright 2020 Alexander Thamm GmbH

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
