---
author: Sumitro
date: 2017-06-19T23:23:31+05:30
description: Smallish tutorial about using Hugo
draft: false
#keywords:
#- hugo
#- tutorial
tags:
- hugo
- tutorial
title: Using Hugo
topics:
- topic 1
type: post
---

![Hugo is so colourful](../../../../images/hugo-logo.png)

Installing Hugo is not a big deal. You just have to download the proper `deb` file from their [site][1]. But using it, is another issue. The main problem that I faced was using the themes. Every theme has a `toml` configuration file which is in charge of all the web elements (forgive me misusing the terms for I don't web development too well). The problem is that theme makers use different `toml` files; some are feature-rich and some are barren. Therefore, I had a hard time understanding them. But after spending a solid 3-4 hours, I got the hang of it.

In this blog, I shall talk about how to properly deploy your site to some hosting space using Hugo. Follow the steps mentioned below

### Creating the site using Hugo

I shall not discuss this as this is very well discussed in [their site][2].

### Installing a theme

1. Go to https://themes.gohugo.io
2. Select any theme. Let's assume you have selected the **Hyde-Y** theme
3. Using `git`, clone the theme into the `theme` directory of your Hugo site directory 
4. Copy the file `new_site/themes/hyde-y/theme.toml` to `new_site/config.toml`. Simply speaking, overwrite the file
5. Check using `hugo server` to see if the theme is working properly
6. It should be served at `127.0.0.1:1313`

_Note : You might want to use **Incognito mode** to check your site_

### Creating the posts

I shall also not discuss this as this is written in multiple tutorials before me. You must be wondering 'Why the hell is this guy writing a tutorial then?'

That is because I can and I will!

_Note : Seriously, just visit the site the original site and take a look at their [quickstart guide][2]; it will be enough_

### Creating an 'About' page

There is no magic regarding creating the About page. There is only hard work (I consider it to be hard work as I am not special)

However, the process of attaching the About page is a sort of hit-and-trial method. You should look into the `toml` file to see how it should be attached. Read the theme documentation page for the best results.

### `baseurl` error

If you are not careful about this part, your deployed site will not have any styling. So be careful

1. Let's assume your are hosting your site at Github Pages and the URL is foobar.github.io
2. Then, the `baseurl` should be `http://foobar.github.io/`. Make sure to give the forward slash at the end, otherwise you will have a non CSS website 

### Integration of Disqus

If you want Disqus support in your website, you have to first create a short URL for your website.

1. Go to https://disqus.com/admin/create/
2. Give a website name, say **foobar**
3. Go to `https://foobar.disqus.com/admin/settings/general`
4. In website URL, put your website's URL, that is ``https://foobar.github.io`

_Note : I spent 1 hour trying to connect Disqus to my website_

[1]: https://github.com/gohugoio/hugo/releases/
[2]: https://gohugo.io/overview/quickstart/
