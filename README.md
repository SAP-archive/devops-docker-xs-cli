[![REUSE status](https://api.reuse.software/badge/github.com/SAP/devops-docker-xs-cli)](https://api.reuse.software/info/github.com/SAP/devops-docker-xs-cli)

# XS Command-Line Client Dockerfile
## Description
To bring an SAP HANA XS Advanced application to an SAP HANA Server, deploy the application with the XS command-line tool. 
With this Dockerfile, you can wrap the XS command-line client and run the resulting image with the Jenkins pipeline library of [project "Piper"][piper]. For convenience, this image also includes the [MTA Build tool](https://github.com/SAP/cloud-mta-build-tool) to avoid using a different image in a typical integration pipeline.


## Requirements
* General requirements can be found in the [repository readme][general]
* An S-User for [SAP ONE][sapone]
* Download XS command-line client ```XS_CLIENT00P_<version>.ZIP``` for Linux on x86_64 from [SAP ONE][sapone]

## How to Build It

This image is not provided on hub.docker.com. Instead, [build][dockerbuild] this Dockerfile locally before using it. Either clone the repository or download the Dockerfile and put the XS CLI ZIP file into the same directory. Here, you can find a [tutorial][xsclient] on how to get the XS command-line client package.

### Build Arguments
| Argument | Description |
| ---------| ------------|
| **XSZIP** | Path to your XS CLI ZIP file |
| **MBT_VERSION** | Version of the [MTA Build tool](https://github.com/SAP/cloud-mta-build-tool) to use. Default is 1.2.24 |

Example:
```
docker build -t ppiper/xs-cli --build-arg XSZIP=XS_CLIENT00P_<version>.ZIP .
```

## How to Execute It
Assuming you have built the image by using the tag `ppiper/xs-cli`, you can run it with:

```
docker run ppiper/xs-cli xs <command>
```


[piper]: https://sap.github.io/jenkins-library/
[xsclient]: https://developers.sap.com/germany/tutorials/hxe-ua-install-xs-xli-client.html
[sapone]: https://launchpad.support.sap.com/
[general]: https://github.com/SAP/devops-docker-images/blob/master/README.md
[dockerbuild]: https://docs.docker.com/engine/reference/commandline/build/
[dockerbuildadd]: https://docs.docker.com/engine/reference/builder/#add
