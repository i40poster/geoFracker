# Overview
An extension of [rocker/hadleyverse](https://github.com/rocker-org/hadleyverse) adding geo processing at R Studio.

# License

Same as [rocker/hadleyverse](https://github.com/rocker-org/hadleyverse), that is released as GPLv2 at the time of this push. My understanding here is that this repo must follow the the source of derivation. Feel free to comment about.


Reference: https://github.com/CentOS/sig-cloud-instance-images/issues/48

# Use

This container is available at DockerHub under the repo **it4poster/geofracker**:

```bash

docker run -d -p 8787:8787 it4poster/geofracker  /bin/bash

```

To acces RStudio just open your browser at: http://$docker_host_IP:8787

eg: http://localhost:8787

The user is: rstudio
The password is: rstudio
