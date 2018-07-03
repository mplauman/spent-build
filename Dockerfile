FROM alpine:3.7

ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

RUN apk update && \
    apk add nodejs nodejs-npm make docker python git

RUN node --version && \
    npm --version && \
    python --version && \
    git --version

ARG KUBECTL_VERSION=v1.11.0
RUN wget https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client

ARG GCLOUD_VERSION=207.0.0
RUN wget -O - https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz | tar -xz -C /usr/local && \
    /usr/local/google-cloud-sdk/bin/gcloud --version
ENV PATH="${PATH}:/usr/local/google-cloud-sdk/bin"

WORKDIR /src

