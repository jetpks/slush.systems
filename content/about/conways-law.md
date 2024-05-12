---
title: "Conway's Law"
date: "2024-05-11T20:46:13-06:00"
tags: [sre, business, devops, conway's law, slack, reliability, incentives]
keywords: []
cover: ""
draft: false
description: >-
  you actually kind of like that even though you know it's bad for your health
  because fixing things by shoving untested changes straight into production is
  ***exhilarating***. you ***like*** doing cowboy shit.

---

```c++
undercover_bizdev_guy joined #sre_support_group
undercover_bizdev_guy: Hi devops brethren. How many of you use Splunk and are
not happy with it? I would love to understand your workflow and day to day
tools you use to solve incidents quickly (under strict MTTR) I have a thesis
that AI can help here.
```

**eric:** _@undercover_bizdev_guy_ i can't tell if you're new to the internet or
what your deal is, but i'll bite. splunk is fine. sumo is fine. a bunch of
parquet files in s3 is impressive and also fine. the tooling is pretty much all
fine.

the biggest impediment to reliability is that it's not a priority to almost any
business until the lack of it starts to impact revenue. when this happens,
businesses grudgingly create a new team that's tasked with "making this thing
reliable." but without changing anything or impacting velocity in any way. this
team is called ~~devops~~ sre. 

that new sre team tries to rub observability on everything and establish some
ops patterns they read were good. they're mildly successful. the system isn't
really reliable, but it is *better* because the team is killing themselves with
on-call work.

eventually some burnt out sre answering a page at 4:00 am for some trivial
mistake realizes that the engineers building this stuff have absolutely no
incentive to make it reliable because reliability is not their responsibility --
it's the sre team's responsibility. 

so sre starts recommending SLOs and more involvement from the rest of
engineering, but it mostly falls on deaf ears. the product engineers absolutely
do not want to take call, why would they? it's stressful and *not their job*.
leadership doesn't want to make it their job because staff is already stretched
thin and they just hired a whole god damn team to tackle this problem. this
quagmire lasts years. 

and that's when you realize your job isn't to make these systems reliable. the
business doesn't want that. your job is answer the phone at any hour and solve
any problem. and you actually kind of like that even though you know it's bad
for your health because fixing things by shoving untested changes straight into
production is *exhilarating*. you *like* doing cowboy shit. it's *fun*. but it
also feels sisyphean and it's not really "reliability engineering." and you
wonder if it's better elsewhere but 15 years of experience says it's mostly all
the same. and then you ask yourself, is this so bad? you make ludicrous money
doing it. you should just keep your head down. but it's always in the back of
your mind, nagging at you, "this incident didn't have to happen. this system
could be actually reliable if the business wanted it to be. ***but the business
doesn't want that***."

reliability is a reflection of the incentive structures inside engineering
organizations. that makes it leadership's problem. and if you look closely at
this explanation, you'll find it's just Conway's Law. the tooling, llm based or
not, isn't the problem.

also mttr is a stupid metric.

**undercover_bizdev_guy:** thanks for your response.

&lt;*radio silence*&gt;
