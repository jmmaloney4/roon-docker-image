# Roon Docker Image

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

```
./release.sh <Roon Version> <Roon Build>
```

This will push a tag, which will trigger github actions to create a new release and push a new `latest` docker tag.
