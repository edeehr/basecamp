2W Basecamp Packer Template
===========

Packer template using AWS Linux AMI to build an httpd/php Web Server.  Simplicity is the goal as it is intended for use in demos and basecamps/workshops.  The template flow is pretty simple:
- Start with an AWS Linux AMI
- Install Updates (gotta be current on patches)
- Install httpd and php
- Perform usual file gymnastics to upload template and then move it to the /var/www/html directory
- Start up httpd service
- Set httpd to automatically start on boot
- Celebrate

Web Server
----------------------

- `web_server.json` - Packer Template - trivial setup for nginx
- `install.sh` - Shell script executed during AMI build
- `index.php` - Simple, custom web page. httpd/php will use index.php in place of index.html (not sure why)

Usage
-----

```
packer <validate|build> <template>
```

To Do
-----
```
- Add filter to grab the latest AWS Linux AMI as the starting point
- Flesh out AMI tags
```


Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
