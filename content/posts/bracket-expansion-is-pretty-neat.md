+++
title = "Bracket expansion is pretty neat"
date = "2023-03-04T19:55:22-07:00"
author = "Eric Jacobs"
cover = ""
tags = ["fish", "shell", "tooling"]
keywords = []
description = ""
showFullContent = false
color = "" #color from the theme settings
+++

I bought a font for this blog.
[CartographCF](https://connary.com/cartograph.html) -- I love this font. I use
it in my terminals & editor. For the web, it's packaged as 32 separate files:

```
~/Downloads/Cartograph CF                          12ms eric@nonagon 20:03:33
❯ ll
total 3.0M
-rw-r--r-- 1 eric eric 118K Mar  3 14:16 CartographCF-BoldItalic.woff
-rw-r--r-- 1 eric eric  84K Mar  3 14:16 CartographCF-BoldItalic.woff2
-rw-r--r-- 1 eric eric 107K Mar  3 14:16 CartographCF-Bold.woff
-rw-r--r-- 1 eric eric  77K Mar  3 14:16 CartographCF-Bold.woff2
-rw-r--r-- 1 eric eric 120K Mar  3 14:16 CartographCF-DemiBoldItalic.woff
-rw-r--r-- 1 eric eric  86K Mar  3 14:16 CartographCF-DemiBoldItalic.woff2
-rw-r--r-- 1 eric eric 107K Mar  3 14:16 CartographCF-DemiBold.woff
-rw-r--r-- 1 eric eric  77K Mar  3 14:16 CartographCF-DemiBold.woff2
-rw-r--r-- 1 eric eric 119K Mar  3 14:16 CartographCF-ExtraBoldItalic.woff
-rw-r--r-- 1 eric eric  85K Mar  3 14:16 CartographCF-ExtraBoldItalic.woff2
-rw-r--r-- 1 eric eric 106K Mar  3 14:16 CartographCF-ExtraBold.woff
-rw-r--r-- 1 eric eric  77K Mar  3 14:16 CartographCF-ExtraBold.woff2
-rw-r--r-- 1 eric eric 116K Mar  3 14:16 CartographCF-ExtraLightItalic.woff
-rw-r--r-- 1 eric eric  84K Mar  3 14:16 CartographCF-ExtraLightItalic.woff2
-rw-r--r-- 1 eric eric 105K Mar  3 14:16 CartographCF-ExtraLight.woff
-rw-r--r-- 1 eric eric  76K Mar  3 14:16 CartographCF-ExtraLight.woff2
-rw-r--r-- 1 eric eric 122K Mar  3 14:16 CartographCF-HeavyItalic.woff
-rw-r--r-- 1 eric eric  88K Mar  3 14:16 CartographCF-HeavyItalic.woff2
-rw-r--r-- 1 eric eric 110K Mar  3 14:16 CartographCF-Heavy.woff
-rw-r--r-- 1 eric eric 115K Mar  3 14:16 CartographCF-LightItalic.woff
-rw-r--r-- 1 eric eric  82K Mar  3 14:16 CartographCF-LightItalic.woff2
-rw-r--r-- 1 eric eric 105K Mar  3 14:16 CartographCF-Light.woff
-rw-r--r-- 1 eric eric  76K Mar  3 14:16 CartographCF-Light.woff2
-rw-r--r-- 1 eric eric 116K Mar  3 14:16 CartographCF-RegularItalic.woff
-rw-r--r-- 1 eric eric  83K Mar  3 14:16 CartographCF-RegularItalic.woff2
-rw-r--r-- 1 eric eric 105K Mar  3 14:16 CartographCF-Regular.woff
-rw-r--r-- 1 eric eric  75K Mar  3 14:16 CartographCF-Regular.woff2
-rw-r--r-- 1 eric eric 115K Mar  3 14:16 CartographCF-ThinItalic.woff
-rw-r--r-- 1 eric eric  82K Mar  3 14:16 CartographCF-ThinItalic.woff2
-rw-r--r-- 1 eric eric 104K Mar  3 14:16 CartographCF-Thin.woff
-rw-r--r-- 1 eric eric  75K Mar  3 14:16 CartographCF-Thin.woff2
```

I already feel weird about uploading the files I'm using to a public git repo.
The least I can do is upload _just_ the variants I'm really using: DemiBold,
DemiBoldItalic, Heavy, and HeavyItalic.

I need to `rm` the rest.

```fish
~/Downloads/Cartograph CF                          11ms eric@nonagon 20:11:17
❯ rm CartographCF-{ExtraLight,ExtraBold,Light,Bold,Regular,Thin}{,Italic}.woff{,2}

~/Downloads/Cartograph CF                           7ms eric@nonagon 20:11:28
❯ ll
total 720K
-rw-r--r-- 1 eric eric 120K Mar  3 14:16 CartographCF-DemiBoldItalic.woff
-rw-r--r-- 1 eric eric  86K Mar  3 14:16 CartographCF-DemiBoldItalic.woff2
-rw-r--r-- 1 eric eric 107K Mar  3 14:16 CartographCF-DemiBold.woff
-rw-r--r-- 1 eric eric  77K Mar  3 14:16 CartographCF-DemiBold.woff2
-rw-r--r-- 1 eric eric 122K Mar  3 14:16 CartographCF-HeavyItalic.woff
-rw-r--r-- 1 eric eric  88K Mar  3 14:16 CartographCF-HeavyItalic.woff2
-rw-r--r-- 1 eric eric 110K Mar  3 14:16 CartographCF-Heavy.woff
-rw-r--r-- 1 eric eric  79K Mar  3 14:16 CartographCF-Heavy.woff2

```

Nice. I'm also just using the woff2 variants, so...

```fish
~/Downloads/Cartograph CF                          10ms eric@nonagon 20:22:20
❯ rm *woff

~/Downloads/Cartograph CF                           4ms eric@nonagon 20:22:27
❯ ll
total 336K
-rw-r--r-- 1 eric eric 86K Mar  3 14:16 CartographCF-DemiBoldItalic.woff2
-rw-r--r-- 1 eric eric 77K Mar  3 14:16 CartographCF-DemiBold.woff2
-rw-r--r-- 1 eric eric 88K Mar  3 14:16 CartographCF-HeavyItalic.woff2
-rw-r--r-- 1 eric eric 79K Mar  3 14:16 CartographCF-Heavy.woff2
```

Bam.

## What's shell expansion?

Even if you're not famliar with bracket expansion (e.g. `{,Italic}`,) you're
probably famliar with globbing (e.g. `*woff`.) Both of these are **shell
expnasion**. Your shell (bash, fish, zsh, etc) is expanding those patterns into
arguments before executing your command. There's more than these two, too.

This works the same way anywhere in your shell:

```fish
~/Downloads/Cartograph CF                           0ms eric@nonagon 20:34:12
❯ echo *
CartographCF-DemiBold.woff2 CartographCF-DemiBoldItalic.woff2 CartographCF-Heavy.woff2 CartographCF-HeavyItalic.woff2

~/Downloads/Cartograph CF                           0ms eric@nonagon 20:35:04
❯ for font in *-DemiBold{,Italic}.woff2
      echo "hey it's a font: " $font
  end
hey it's a font:  CartographCF-DemiBold.woff2
hey it's a font:  CartographCF-DemiBoldItalic.woff2

```

### Bracket expansion

Bracket expansion works a little bit like a `for each` loop. For each item
inside the brackets, you get an argument with the item in place of the brackets.
For example,

```fish
❯ echo foo{1,2,3}
foo1 foo2 foo3
```

Items inside the brackets can also be empty strings if you want,

```fish
❯ echo foo{,bar}
foo foobar
```

And you can put in as many bracket expansions as you want, like in the `rm`
command above. Let's take a closer look at that with `echo` instead of `rm`:

```fish
❯ echo CartographCF-{ExtraLight,ExtraBold,Light,Bold,Regular,Thin}{,Italic}.woff{,2}
CartographCF-ExtraLight.woff CartographCF-ExtraBold.woff CartographCF-Light.woff CartographCF-Bold.woff CartographCF-Regular.woff CartographCF-Thin.woff CartographCF-ExtraLightItalic.woff CartographCF-ExtraBoldItalic.woff CartographCF-LightItalic.woff CartographCF-BoldItalic.woff CartographCF-RegularItalic.woff CartographCF-ThinItalic.woff CartographCF-ExtraLight.woff2 CartographCF-ExtraBold.woff2 CartographCF-Light.woff2 CartographCF-Bold.woff2 CartographCF-Regular.woff2 CartographCF-Thin.woff2 CartographCF-ExtraLightItalic.woff2 CartographCF-ExtraBoldItalic.woff2 CartographCF-LightItalic.woff2 CartographCF-BoldItalic.woff2 CartographCF-RegularItalic.woff2 CartographCF-ThinItalic.woff2
```

We get all the types Light, Bold, etc, both bare and with Italic, and then woff
& woff2.

Anyway, bracket expansion is pretty neat.
