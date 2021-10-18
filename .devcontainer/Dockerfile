# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.194.3/containers/javascript-node/.devcontainer/base.Dockerfile

ARG VARIANT="16-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-${VARIANT}

#### Install required tools

RUN apt-get update -y && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends python3 zip make python3-pip

### Install awscliv2 for arm, use x86_64 instead of aarch64 for x86(64-bit)

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

#### Install serverless framework

RUN npm install -g serverless
