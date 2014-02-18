# Xdan Datetimepicker Rails

This gem adds @xdan's [datetimepicker](https://github.com/xdan/datetimepicker) to the Rails asset pipeline.

## Installation

Add this line to your application's Gemfile:

    gem 'xdan-datetimepicker-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xdan-datetimepicker-rails

## Usage

Require the jquery file into your `application.js.coffee` file:

```coffee
#= require jquery.xdan.datetimepicker
```

Import the stylesheet in your `application.css.scss` file:

```sass
@import "jquery.xdan.datetimepicker";
```

Start using it!

```coffee
$ ->
  $(".datetimepicker").datetimepicker()
```

See the [detailed documentation](http://xdsoft.net/jqplugins/datetimepicker/) for more options. When the site is back up I'll try to port some of them into this README or move them to the official repo of [datetimepicker](https://github.com/xdan/datetimepicker).

## Versioning

This gem will attempt to maintain the same version as the `datetimepicker` library.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/xdan-datetimepicker-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
