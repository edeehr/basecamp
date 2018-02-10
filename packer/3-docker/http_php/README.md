2W Basecamp Packer Template
===========

Packer template to build the Nginx Web Server AWS AMIs.  Intent was to keep this simple as the intended use is for demos or basecamps/workshops.  The template flow is pretty simple:
- Start with an AWS Linux AMI
- Install Updates
- Install nginx
- Set nginx to automatically start on boot

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
- see root page
- should I split this into it's own repo.  While I did this tangent from terraform scripts, it may be better alone
- Change directory name to "aws_linux_web_server_http_php" - pretty accurate description
- Flesh out AMI tags
```

Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
