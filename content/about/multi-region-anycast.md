---
title: "Multi-region presence with anycast"
date: "2023-03-11T22:34:02-07:00"
author: ""
cover: ""
tags: [anycast, multi-region, http]
keywords: []
description: >-
  This blog is coming to you live from servers in California, Virginia, and
  Paris. Your requests are automatically routed to whichever datacenter is
  closer to you in order to get you these pages as fast as possible.
showFullContent: false
color: "" #color from the theme settings
---

Anycast? Why does it matter? How does it work?

The big selling point of anycast is that it lets your users connect to your
application in a datacenter that's close to them, massively reducing latency. A
big selling point of how [Fly.io](https://fly.io/) does anycast is that it's a
default feature that requires no complicated setup or cost.

To make it work for this blog, there's really nothing special I have to do
except turn it on. No DNS changes, no web server config changes, and no extra
first-time setup. I just select the regions I want, and deploy.

This works because this site's IP address is _announced_ from every one of
[Fly.io](https://fly.io/)'s datacenters around the world. When a new connection
is opened to slush.systems, the internet's routing infrastructure
[BGP](https://en.wikipedia.org/wiki/Border_Gateway_Protocol), automatically
routes that connection to whichever of Fly's datacenters is closest. If my
website is deployed in that datacenter, then the request is served immediately.
If not, then Fly reroutes the connection to a datacenter where I have presence.

Currently, this site is deployed in Denver (den) and Virginia (iad):

```fish
❯ flyctl regions list -a slushsystems
Region Pool: 
den
iad
```

With a few commands, we could also deploy this site to Seattle, Spain,
Singapore, South Africa, Sydney, and Sao Paolo. That would give almost every
person on the planet access to this content with less than 100ms of latency. So
let's do it.

The airport codes for Seattle, Spain, Singapore, South Africa, Sydney, and Sao
Paolo are `sea`, `mad`, `sin`, `jnb`, `syd`, and `gru` respectively.

```fish
❯ flyctl regions add sea mad sin jnb syd gru
Region Pool: 
den
gru
iad
jnb
mad
sea
sin
syd

❯ flyctl scale count 8
Count changed to 8

❯ flyctl deploy
==> Verifying app config
--> Verified app config
==> Building image
<snip/>
 8 desired, 8 placed, 8 healthy, 0 unhealthy [health checks: 16 total, 16 passing]
--> v30 deployed successfully
```

Just like that, this site is global. Low latency for everyone.

You may be thinking, "wow, i bet that costs a fortune," but it doesn't. There's
one virtual machine per region * $2/month/vm * 8 regions = $16/month. Not bad to
deliver low latency content to most internet-accessing folks on the planet.

However, I don't intend to keep it this way. I'll be scaling down to just `sjc`,
`iad`, and `cdg`. That's California, Virginia, and Paris. Having just 3 VMs up
keeps me within Fly.io's free tier. The reality is that this site isn't going to
get much traffic -- it's niche content for nerds. Reading about how cool BGP is
doesn't have mass appeal. The site will still be accessible everywhere, of
course, and it will still be relatively fast -- compressed static sites tend to
be. It just won't be absolutely snappy for absolutely everyone.

```fish
❯ flyctl regions add cdg sjc
Region Pool: 
cdg
den
gru
iad
jnb
mad
sea
sin
sjc
syd

❯ flyctl regions remove syd sin sea mad jnb gru den
Region Pool: 
cdg
iad
sjc

❯ flyctl scale count 3
Count changed to 3

❯ flyctl deploy
<snip/>
--> v35 deployed successfully
```

## Could I do this on AWS?

Yes you can but not as easily nor as cheaply. AWS sells anycast under the name
AWS Global Accelerator. It's $0.025/hr per region plus some for data transfer.
That shakes out to about $18/month/region plus data transfer. Additionally,
you'd need to setup all the normal AWS infrastructure (iam, vpc, ecs, etc) in
each region you want to service.

For most businesses, those costs are well worth it. But for my
non-revenue-generating hobby blog, I'm grateful this can be done for free on
[Fly.io](https://fly.io/).

## What about the database?

This site is just a pile of HTML & CSS files and doesn't have a database, so no
worries for me.

In general though, deploying a multi-region application gets more complicated
when there's a database involved. [Fly has a managed postgres
product](https://fly.io/blog/globally-distributed-postgres/) to help with this,
too.

But even with that managed postgres product, there's still some engineering
effort involved to make everything function. It depends on the use case, of
course, but IMO the investment is usually worth it.

