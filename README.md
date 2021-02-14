# Roon Docker Image

A Docker image for roon.

```
docker pull ghcr.io/jmmaloney4/roon:latest
```

```
docker run -d \
  --network host
  --name=roon-server \
  -v </path/to/config/>:/config \
  -v </path/to/music/library>:/music \
  --restart unless-stopped \
  ghcr.io/jmmaloney4/roon:latest
```

## Kubernetes Helm Chart
See [github.com/jmmaloney4/charts](https://github.com/jmmaloney4/charts) for a helm chart. 
