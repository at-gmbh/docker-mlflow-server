FROM python:3.10-slim
LABEL maintainer="Alexander Thamm GmbH <contact@alexanderthamm.com>"
ARG PROTOBUF_VERSION=3.19.0
ARG MLFLOW_VERSION=1.19.0

WORKDIR /mlflow/
RUN pip install --no-cache-dir protobuf==$PROTOBUF_VERSION mlflow==$MLFLOW_VERSION
EXPOSE 5000

ENV BACKEND_URI sqlite:////mlflow/mlflow.db
ENV ARTIFACT_ROOT /mlflow/artifacts

CMD mlflow server --backend-store-uri ${BACKEND_URI} --default-artifact-root ${ARTIFACT_ROOT} --host 0.0.0.0 --port 5000