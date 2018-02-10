Packer Template: 2-ami-with-php
===========

### Basics
- Packer template to build an HTTP Web Server with PHP on AWS AMIs.
- PHP installed so that the webpage can show the underlying hostname
- Design objective is to keep this simple as it will be used for demos, basecamps and training purposes
- Flow:
- 1) Start with an AWS Linux AMI
- 2) Install Updates
- 3) Install httpd
- 4) Set httpd to automatically start on boot
- 5) Use custom webpage with php element to show the hostname

### Packer Files
----------------------
| File | Purpose |
|:-------- |:--------|
web_server.json | packer json code to build the image
install.sh | Shell script executed during AMI build
index.html | Simple, custom web page


### Usage
-----
```
packer <validate|build> <template>
```

### Authors
-----
[Kevin Dillon](kdillon@2ndwatch.com)
