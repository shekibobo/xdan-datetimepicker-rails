# Xdan Datetimepicker Rails

This gem adds @xdan's [datetimepicker] to the Rails asset pipeline.

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

## Contributing

1. Fork it ( http://github.com/<my-github-username>/xdan-datetimepicker-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
