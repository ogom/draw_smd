---
layout: default
title:  Overview
---

[![Gem Version](https://badge.fury.io/rb/draw_smd.png)](https://rubygems.org/gems/draw_smd) [![Build Status](https://travis-ci.org/ogom/draw_smd.png?branch=master)](https://travis-ci.org/ogom/draw_smd)

Drawing the State Machine Diagram of Rails.

## Installation

Add this line to your application's Gemfile:

```
gem 'draw_smd'
```

And then execute:

```
$ bundle
```

## Usage

Add this line to your config/routes.rb:

```
mount DrawSmd::Engine, at: '/rails/draw/smd'
```

Draw by selecting the schema:

![example_smd]({{ site.baseurl }}/assets/img/example_smd.png)

## Use

* [state_machine](https://github.com/pluginaweek/state_machine)

## License

* MIT
