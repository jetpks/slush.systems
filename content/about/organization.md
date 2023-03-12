---
title: "Organization"
date: "2023-03-12T15:31:17-06:00"
tags: [organization]
keywords: []
cover: ""
draft: false
description: >-
  Sections, tags, articles, and git info
---

Articles are divided into a few high level sections, [/about]({{< ref "/about"
>}}), (and more) that are linked at the top of the page. Additionally, each
article has several tags that indicate what topics are covered in the article.

At the top of each post and section page, there's a blob of metadata that looks
a bit like this:

```
commit 	  078b762
author 	  eric jacobs
updated 	2023-03-12T10:40:24-06:00
meta 	    /about  —  #anycast  #multi-region  #http  
```

It's meant to look like a bit like a `git log --pretty=full`. Commit links to
the last related change on github. Author is... the author, pulled from the
commit data. Updated is the date & time the change was committed. The meta piece
contains a link to the section, and a link to each tag on the post.
