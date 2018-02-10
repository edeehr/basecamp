Packer Template: 2-http-php-docker-repo
===========

### Basics
- Packer template to build Docker image with HTTP Web Server, PHP and Custom Web page using latest AWS Linux Image.
- Push the image to remote docker repo
- Design objective is to keep this simple as it will be used for demos, basecamps and training purposes
- Flow:
- 1) Start with latest AWS Linux Image from Docker.com repo
- 2) Install Updates
- 3) Install httpd and php
- 4) Copy custom web page to appropriate directory
- Lots of opportunities to further parameterize, just not today

### Packer Files
----------------------
| File | Purpose |
|:-------- |:--------|
web_server.json | packer json code to build the docker image
install.sh | Shell script executed during AMI build to update os, install http, install php and move custom web page to html directory
index.html | Simple, custom web page with php element to show hostname

### Usage
-----
```
packer <validate|build> <template>
```

### Authors
-----
[Kevin Dillon](kdillon@2ndwatch.com)

