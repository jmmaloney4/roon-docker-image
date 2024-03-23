# Roon Docker Image

![docker publish workflow](https://github.com/jmmaloney4/roon-docker-image/actions/workflows/docker-publish.yml/badge.svg)

A Docker image for roon.

```
docker pull ghcr.io/jmmaloney4/roon:latest
```

```
docker run -d \
  --network host
  --name=roon-server \
  -v </path/to/config/>:/var/roon \
  -v </path/to/music/library>:/music \
  --restart unless-stopped \
  ghcr.io/jmmaloney4/roon:latest
```

## Kubernetes Helm Chart
See [github.com/jmmaloney4/charts](https://github.com/jmmaloney4/charts) for a helm chart. 

### Releasing

See the [Release Notes](https://community.roonlabs.com/c/roon/software-release-notes/) for the latest.

Or run `echo ${$(tar -zxvOf RoonServer_linuxx64.tar.bz2 RoonServer/VERSION 2> /dev/null | head -n 1)#*20000}`

```
./release.sh <Roon Version> <Roon Build>
```

This will push a tag, which will trigger github actions to create a new release and push a new `latest` docker tag.
