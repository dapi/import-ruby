# ModuleImport

[![Build Status](https://travis-ci.org/dapi/module_import.svg?branch=master)](https://travis-ci.org/dapi/module_import)

The import statement is used to import functions and objects that have been exported from an external module or classes in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'module_import'
```

or require injector when you want to have `import` method in `Object`

```ruby
gem 'module_import', require: 'module_import/inject'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install module_import

## Usage

```ruby
# foo_helpers.rb
module FooHelpers
  def some_helper
    puts 'Ok'
  end
end

# example1.rb

require 'foo_helpers'
Helpers = import FooHelpers
Helpers.some_helper
# > Ok
```


TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/module_import. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## Alternatives

* https://github.com/franckverrot/rb_import

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

