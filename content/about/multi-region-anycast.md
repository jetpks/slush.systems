---
title: "Multi-region anycast"
date: "2023-03-11T22:34:02-07:00"
author: ""
cover: ""
tags: [anycast, multi-region, http]
keywords: []
description: >-
  This blog is coming to you live from servers in Denver and Virginia. Your
  requests are automatically routed to whichever datacenter is closer to you in
  order to get you these pages as fast as possible.
showFullContent: false
color: "" #color from the theme settings
---

Anycast? Why does it matter? How does it work?

The big selling point of anycast is that it lets your users connect to your
application in a datacenter that's close to them, massively reducing latency. A
big selling point of how [Fly.io](https://fly.io/) does anycast is that it's a
default feature that requires no complicated setup.

There are no DNS changes. There's nothing special I have to do for my web
server. There's no real configuration changes at all. I just select the regions
where I want to deploy, and deploy.

This works because this site's IP address is _announced_ from every one of
[Fly.io](https://fly.io/)'s datacenters around the world. When a new connection
is opened to slush.systems, the internet's routing infrastructure
[BGP](https://en.wikipedia.org/wiki/Border_Gateway_Protocol), automatically
routes that connection to whichever of Fly's datacenters is closest. If my
website is deployed in that datacenter, then the request is served immediately.
If not, then Fly reroutes the connection to a datacenter that 

On [Fly](https://fly.io/), I can deploy this site to Seattle, Spain, Singapore,
Sydney, and Sao Paolo with just two commands and no extra configuration. That
means almost every person on the planet is less than 100ms from one of my
servers. In fact, let's do that.

Anycast lets your users connect to your application through a datacenter that's
close to them. That means the extra latency 

One of the big reasons I'm hyped about [fly.io](https://fly.io/) is that they
make it so easy to deploy an application in multiple regions. While I already
have this site If I wanted to, I
could add [slush.systems](https://slush.systems/) into Johannesburg, South
Africa; Paris, France; Sydney, Australia; Sao Paolo, Brazil; and Singapore in
abo
