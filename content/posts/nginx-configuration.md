+++
title = "Nginx Configuration"
date = "2023-03-07T08:12:00-07:00"
author = "Eric Jacobs"
cover = ""
tags = []
keywords = []
description = ""
showFullContent = false
color = "" #color from the theme settings
draft = true
+++

Unstructured list of things I want:

- [http2](https://ubiq.co/tech-blog/how-to-enable-http2-in-nginx/)
- [setting & optimizing static file
  serving](https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/)
- [tuning
  guide](https://www.arubacloud.com/tutorial/filter-and-optimize-static-file-requests-with-nginx-on-ubuntu-18-04.aspx)

- EUGH, i'm going to have to run a separate exporter process for nginx. I
  checked apache and it's the same way. mother fucker.
- let's just deploy without metrics for now and see what we get out of the
  default fly.io stuff

Maybe I need to get a better idea of what i really want.

- _fast_
- http2
- prometheus metrics
- preferably in a single binary

