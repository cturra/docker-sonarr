About this container
---
This container runs the Sonarr PVR service. More about Sonarr can be found at:

  https://sonarr.tv


Building and Running with Docker Compose
---
Using the `docker-compose.yml` file included in this git repo, you can build
the container yourself (should you choose to).

```
# buid sonarr
$> docker-compose build sonarr

# run sonarr
$> docker-compose up -d sonarr

# (optional) check the logs
$> docker-compose logs sonarr
```


Building and Running with Docker engine
---
Using the `vars` file in this git repo, you can update any of the variables to
reflect your environment. Once updated, simply execute the `build` then `run` scripts.

```
# build sonarr
$> ./build.sh

# run sonarr
$> ./run.sh
```
