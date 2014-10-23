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
# /app/assets/javascripts/datetimepicker.js.coffee

#= require jquery.xdan.datetimepicker

@setupDateTimePicker = (container) ->
  defaults = {
    formatDate: 'y-m-d',
    format: 'Y-m-d H:i',
    allowBlank: true,
    defaultSelect: false,
    validateOnBlur: false
  }

  entries = $(container).find('input.datetimepicker')
  entries.each (index, entry) ->
    options = $(entry).data 'datepicker-options'
    $(entry).datetimepicker $.extend(defaults, options)

$ ->
  setupDateTimePicker $('body')

```


See the [detailed documentation](http://xdsoft.net/jqplugins/datetimepicker/) for more options. When the site is back up I'll try to port some of them into this README or move them to the official repo of [datetimepicker](https://github.com/xdan/datetimepicker).

### SimpleForm Integration

```ruby
# /app/inputs/datetimepicker_input.rb

class DatetimepickerInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super.push("datetimepicker")
  end

  def input_type
    :string
  end

  def input_html_options
    super.tap do |opts|
      opts[:data] ||= {}
      opts[:data].merge! datepicker_options
      opts[:value] ||= value
    end
  end

  def value
    val = object.send(attribute_name)
    return DateTime.new(val.year, val.month, val.day, val.hour, val.min).strftime("%Y-%m-%d %H:%M") if val.is_a?(Time)
    return val if val.nil?
    val.to_s
  end

  private
    def datepicker_options
      options = self.options.fetch(:datepicker_options, {})
      options = Hash[options.map{ |k, v| [k.to_s.camelcase(:lower), v] }]
      { datepicker_options: options }
    end
end

```

### Formtastic Integration

```ruby
# /app/inputs/datetimepicker_input.rb

class DatetimepickerInput < ::Formtastic::Inputs::StringInput
  def input_html_options
    super.tap do |options|
      options[:class] = [options[:class], "datetimepicker"].compact.join(' ')
      options[:data] ||= {}
      options[:data].merge! datepicker_options
      options[:value] ||= value
    end
  end

  def value
    val = object.send(method)
    return DateTime.new(val.year, val.month, val.day, val.hour, val.min).strftime("%Y-%m-%d %H:%M") if val.is_a?(Time)
    return val if val.nil?
    val.to_s
  end

  private
    def datepicker_options
      options = self.options.fetch(:datepicker_options, {})
      options = Hash[options.map{ |k, v| [k.to_s.camelcase(:lower), v] }]
      { datepicker_options: options }
    end
end

```

## Versioning

This gem will attempt to maintain the same version as the `datetimepicker` library.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/xdan-datetimepicker-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
