# Unicode::Eaw

[Unicode East Asian Width data](https://www.unicode.org/reports/tr11/) for Ruby

This library is a port of [easta](https://github.com/teppeis/easta) for Node.js.

Support Unicode version: [12.1.0](https://www.unicode.org/Public/12.1.0/ucd/EastAsianWidth.txt)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unicode-eaw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unicode-eaw

## Usage

```ruby
Unicode::Eaw.property('A') #=> :Na  ## Narrow
Unicode::Eaw.property('Ａ') #=> :F  ## Fullwidth
Unicode::Eaw.property('ア') #=> :W  ## Wide
Unicode::Eaw.property('ｱ') #=> :H   ## Halfwidth
Unicode::Eaw.property('α') #=> :A  ## Ambiguous
Unicode::Eaw.property('À') #=> :N  ## Neutral
```

## Changelog

### 2.0.0

Breaking change: rename `Eaw.width` to `Eaw.property`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takahashim/unicode-eaw.
