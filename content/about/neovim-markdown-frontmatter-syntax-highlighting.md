---
title: Neovim Markdown Frontmatter Syntax Highlighting
date: 2023-03-08T20:50:36-07:00
cover:
tags: [neovim, syntax, yaml, toml, frontmatter]
keywords: []
description: >-
  Neovim syntax highlighting for yaml & toml frontmatter in markdown files
showFullContent: false
draft: false
---

I love syntax highlighting. It makes details immediately glanceable that would
otherwise be lost in a sea of text. Naturally, when I started working with Hugo,
I wanted the yaml/toml frontmatter in my markdown files to have proper syntax
highlighting.

## yaml vs toml frontmatter

In general for configuration, I prefer toml to avoid the edge cases of yaml.
However for markdown frontmatter where ergonomics is key, I prefer yaml because
of its lax quoting rules.

## back to syntax highlighting

I found [this blog
post](https://www.maero.dk/markdown-frontmatter-syntax-highlighting/), which
lead me to create `~/.config/nvim/after/syntax/markdown.vim`:

```vim
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
syntax include @Toml syntax/toml.vim
syntax region tomlFrontmatter start=/\%^+++$/ end=/^+++$/ keepend contains=@Toml
```

And that _only_ works for yaml. It _can_ work for toml if i put toml first, but
I can't seem to get it to work for both. Alas.

Now my frontmatter looks like this:

![open vim session with properly highlighted yaml
frontmatter](/img/yaml-frontmatter-syntax-highlighting.png)

_Nice._
