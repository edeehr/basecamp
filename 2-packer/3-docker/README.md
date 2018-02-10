Packer Template: Docker Images
===========

### Basics
- Packer templates to build docker images
- Design objective is to keep this simple as it will be used for demos, basecamps and training purposes

### Directories
----------------------
| Directory | Purpose |
|:-------- |:--------|
1-http-php | docker image with aws linux with http and php installed
2-http-php-docker-repo | docker image with aws linux with http and php installed, pushed to docker.com repo


### Usage
-----
```
packer <validate|build> <template>
```

### Authors
-----
[Kevin Dillon](kdillon@2ndwatch.com)
