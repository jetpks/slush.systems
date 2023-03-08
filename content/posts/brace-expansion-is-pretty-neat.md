+++
title = "Brace expansion is pretty neat"
date = "2023-03-04T19:55:22-07:00"
author = "Eric Jacobs"
cover = ""
tags = ["fish", "shell", "tooling"]
keywords = []
description = "Exploring the magic of brace expansion in the shell."
showFullContent = false
color = "" #color from the theme settings
+++

I bought a font for this blog.
[CartographCF](https://connary.com/cartograph.html) -- I love this font. I use
it in my terminals & editor.

For the web, it's packaged as 32 separate files:

```fish
~/Downloads/Cartograph CF                          12ms eric@nonagon 20:03:33
❯ ls
CartographCF-BoldItalic.woff         CartographCF-HeavyItalic.woff
CartographCF-BoldItalic.woff2        CartographCF-HeavyItalic.woff2
CartographCF-Bold.woff               CartographCF-Heavy.woff
CartographCF-Bold.woff2              CartographCF-Heavy.woff2
CartographCF-DemiBoldItalic.woff     CartographCF-LightItalic.woff
CartographCF-DemiBoldItalic.woff2    CartographCF-LightItalic.woff2
CartographCF-DemiBold.woff           CartographCF-Light.woff
CartographCF-DemiBold.woff2          CartographCF-Light.woff2
CartographCF-ExtraBoldItalic.woff    CartographCF-RegularItalic.woff
CartographCF-ExtraBoldItalic.woff2   CartographCF-RegularItalic.woff2
CartographCF-ExtraBold.woff          CartographCF-Regular.woff
CartographCF-ExtraBold.woff2         CartographCF-Regular.woff2
CartographCF-ExtraLightItalic.woff   CartographCF-ThinItalic.woff
CartographCF-ExtraLightItalic.woff2  CartographCF-ThinItalic.woff2
CartographCF-ExtraLight.woff         CartographCF-Thin.woff
CartographCF-ExtraLight.woff2        CartographCF-Thin.woff2
```

Since this is a paid font, I already feel weird about uploading it to a public
git repo. The least I can do is upload _just_ the variants I'm really using:
DemiBold, DemiBoldItalic, Heavy, and HeavyItalic.

I need to `rm` the rest.

```fish
~/Downloads/Cartograph CF                          11ms eric@nonagon 20:11:17
❯ rm CartographCF-{ExtraLight,ExtraBold,Light,Bold,Regular,Thin}{,Italic}.woff{,2}

~/Downloads/Cartograph CF                           7ms eric@nonagon 20:11:22
❯ rm *woff

~/Downloads/Cartograph CF                           4ms eric@nonagon 20:11:28
❯ ls
CartographCF-DemiBoldItalic.woff2  CartographCF-HeavyItalic.woff2
CartographCF-DemiBold.woff2        CartographCF-Heavy.woff2
```

Bam. Nice. But how did
`CartographCF-{ExtraLight,ExtraBold,Light,Bold,Regular,Thin}{,Italic}.woff{,2}`
and `*woff` actually translate into the files I wanted to delete? It's through
the magic of [parameter
expansion](https://fishshell.com/docs/current/language.html#parameter-expansion).

## Parameter expansion

Even if you're not famliar with brace expansion (e.g. `{,Italic}`,) you're
probably famliar with globbing (e.g. `*woff`.) Both of these are **parameter
expnasion**. Your shell (bash, fish, zsh, etc) is expanding those patterns into
parameters before executing your command.

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

### Brace expansion

Brace expansion works a little bit like a `for each` loop. For each item inside
the brackets, you get a parameter with the item in place of the braces. For
example,

```fish
❯ echo foo{1,2,3}
foo1 foo2 foo3
```

Items inside the brackets can also be empty strings if you want,

```fish
❯ echo foo{,bar}
foo foobar
```

And you can put in as many brace expansions as you want, like in the `rm`
command above. Let's take a closer look at that with `echo` instead of `rm`:

```fish
❯ echo -e CartographCF-{ExtraLight,ExtraBold,Light,Bold,Regular,Thin}{,Italic}.woff{,2}"\n" | column -x
CartographCF-ExtraLight.woff		 CartographCF-ExtraBold.woff
 CartographCF-Light.woff		 CartographCF-Bold.woff
 CartographCF-Regular.woff		 CartographCF-Thin.woff
 CartographCF-ExtraLightItalic.woff	 CartographCF-ExtraBoldItalic.woff
 CartographCF-LightItalic.woff		 CartographCF-BoldItalic.woff
 CartographCF-RegularItalic.woff	 CartographCF-ThinItalic.woff
 CartographCF-ExtraLight.woff2		 CartographCF-ExtraBold.woff2
 CartographCF-Light.woff2		 CartographCF-Bold.woff2
 CartographCF-Regular.woff2		 CartographCF-Thin.woff2
 CartographCF-ExtraLightItalic.woff2	 CartographCF-ExtraBoldItalic.woff2
 CartographCF-LightItalic.woff2		 CartographCF-BoldItalic.woff2
 CartographCF-RegularItalic.woff2	 CartographCF-ThinItalic.woff2

```

We get all the types Light, Bold, etc, both bare and with Italic, and then woff
& woff2.

Brace expansion is *pretty neat*.
