# XS Command-Line Client Dockerfile
## Description
This Dockerfile wraps the XS command-line client that can be used to perform various developer- and administrator-related tasks. In the context of [project "Piper"][piper] it is used to deploy an SAP HANA XS Advanced application to an SAP HANA Server.

## Requirements

A [Docker](https://www.docker.com/) environment is required to build and run Docker images. You should be familiar with basic Docker commands to build and run the image. To fetch the Dockerfiles and this project's sources to build them locally, a [Git client](https://git-scm.com/) is required.

* An S-User for [SAP ONE][sapone]
* Download XS command-line client ```XS_CLIENT00P_<version>.ZIP``` for Linux on x86_64 from [SAP ONE][sapone]

## How to Build It

This image is not available at hub.docker.com. Instead, you need to [build][dockerbuild] this Dockerfile before using it. Here, you can find a [tutorial][xsclient] on how to get the XS command-line client package.

### Build Arguments
| Argument | Description |
| ---------| ------------|
| **XSZIP** | Path to your XS CLI ZIP file |

Example:
```
docker build -t ppiper/xs-cli --build-arg XSZIP=XS_CLIENT00P_<version>.ZIP --file Dockerfile https://github.com/SAP/devops-docker-images.git#:xs-cli
```

## How to Execute It
Assuming you have built the image by using the tag `ppiper/xs-cli`, you can run it with:

```
docker run ppiper/xs-cli xs <command>
```

## License
Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, v. 2 except as noted otherwise in the [LICENSE file](license).

Please note that Docker images can contain other software which may be licensed under different licenses. This License file is also included in the Docker image. For any usage of built Docker images please make sure to check the licenses of the artifacts contained in the images.

[piper]: https://sap.github.io/jenkins-library/
[xsclient]: https://developers.sap.com/germany/tutorials/hxe-ua-install-xs-xli-client.html
[sapone]: https://launchpad.support.sap.com/
[general]: https://github.com/SAP/devops-docker-images/blob/master/README.md
[dockerbuild]: https://docs.docker.com/engine/reference/commandline/build/
[license]: https://github.com/SAP/devops-docker-xsa-cli/blob/master/LICENSE
