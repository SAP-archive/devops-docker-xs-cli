FROM buildpack-deps:stable-curl

ARG XSZIP
ARG MBT_VERSION=1.2.24
ENV VERSION 0.1
ENV XSCLI=/opt/sap/xs-cli
ENV PATH=$PATH:${XSCLI}/bin

COPY ${XSZIP} /tmp/${XSZIP}

WORKDIR /root

# ps needs to be available to be able to be used in docker.inside, see https://issues.jenkins-ci.org/browse/JENKINS-40101
RUN apt-get update && \
    apt-get install --yes --no-install-recommends procps unzip && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup -gid 1000 piper && \
    useradd piper --uid 1000 --gid 1000 --shell /bin/bash --create-home && \
    mkdir --parents ${XSCLI} && \
    unzip -d ${XSCLI} /tmp/${XSZIP} && \
    rm --recursive --force /tmp/${XSZIP} && \
    (curl -o - -L https://github.com/SAP/cloud-mta-build-tool/releases/download/v${MBT_VERSION}/cloud-mta-build-tool_${MBT_VERSION}_Linux_amd64.tar.gz --silent | tar xzf - mbt ) && \
    mv mbt ${XSCLI}/bin && \
    chown --recursive piper:piper ${XSCLI}
    
USER piper
WORKDIR /home/piper

