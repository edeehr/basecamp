Packer Template: 1_simple_ami
===========

- Packer template to build an HTTP Web Server on AWS AMIs
- Design objective is to keep this simple as it will be used for demos, basecamps and training purposes
- Flow:
-   Start with an AWS Linux AMI
-   Install Updates
-   Install httpd
-   Set httpd to automatically start on boot

Web Server
----------------------

- `web_server.json` - Packer Template - trivial setup for nginx
- `install.sh` - Shell script executed during AMI build
- `index.html` - Simple, custom web page

Usage
-----

```
packer <validate|build> <template>
```

To Do
-----
```
- Is this repo still required.  The php version is pretty straighforward and they are very similar. 
- Revise to reflect changes made as part of httpd/php
```


Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
