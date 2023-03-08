+++
title = "No Go for Caddy"
date = "2023-03-07T07:49:59-07:00"
author = ""
cover = ""
tags = ["caddy", "http", "metrics", "prometheus", "security"]
keywords = []
description = "You can't disable the admin interface and keep Prometheus metrics in Caddy and that's a dealbreaker for me."
showFullContent = false
color = "" #color from the theme settings
+++

In setting up this blog, I wanted to branch out a little bit from my standard
approach of using nginx as my "default" http server. Why not try
[Caddy](https://caddyserver.com/)? I've heard good things & it's written in
golang, so yeah let's give it a shot.

I'm also a metrics nerd & getting Prometheus metrics from my web server is a
hard requirement.

Where Caddy breaks down for me is that the metrics endpoint is served from an
`admin` API that also allows live configuration changes. And there's no way to
change that, according to [the
docs](https://caddyserver.com/docs/caddyfile/directives/metrics):

>
> Note that a /metrics endpoint is also attached to the admin API, which is not
> configurable, and is not available when the admin API is disabled.
>

With Caddy my options are: expose the whole admin API to the Prometheus server,
or don't have metrics. Both are deal breakers.

This would be slightly less of a problem if I was running my own Prometheus
instance on a private network, but I plan to use Fly.io's new metrics offering.
I won't have control or auditing capability over the metrics server.

Is this maybe a little bit paranoid? Yeah. Is there anything to really exploit
on my blog? Not really, it's a static site. But I'd still rather not expose the
ability to modify my http server's config to a network service I don't control.
It just feels dirty.

Nginx it is.

## jk back to caddy

OK, i found [a
blog](https://blog.cubieserver.de/2022/switching-from-nginx-to-caddy-or-not/)
that details how to do caddy metrics while also disabling the rest of the admin
interface, so we're going to do that. 

Supposedly the way metrics are implemented are hella slow but oh well.

