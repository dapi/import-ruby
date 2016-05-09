# ModuleImport

[![Build Status](https://travis-ci.org/dapi/module_import.svg?branch=master)](https://travis-ci.org/dapi/module_import)

[Русский](README.ru.md) | *English*

The import statement is used to import functions and objects that have been exported from an external module or classes in Ruby.

This is a good and simple alternative of `extend` and `include`. The idea is stolen from [ES6 import statement](https://developer.mozilla.org/en/docs/web/javascript/reference/statements/import)

## Rationale

Why not use `extend` or `include`? Because its mixes with your current module/class scope and conflicts with existen or feature method names. Also you can not `include` concerns with same methods in one module. In case of `ModuleImport` you import every module into different namespace. It is safe and clean.

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

### Plain Ruby

```ruby
# foo_helpers.rb
module FooHelpers
  def some_helper
    puts 'Ok foo'
  end
end

# bar_helpers.rb
class BarHelpers
  def another_helper
    puts 'Ok bar'
  end
end

# example1.rb
require 'foo_helpers'
FH = ModuleImport.import FooHelpers
FH.some_helper
# > Ok foo

require 'bar_helpers'
BH = ModuleImport.import BarHelpers
BH.another_helper
# > Ok bar
```

### Rails environment

```ruby
# Gemfile
gem 'module_import', require: 'module_import/inject'

# app/models/user.rb
class User < ActiveRecord::Base
  TextHelpers = import ActionView::Helpers::TextHelper
  
  def short_name
    TextHelpers.truncate name, 20
  end
end
```

I recomend to create directory `app/utils` and contains there primitive helpers to use its in any classes in application.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/module_import. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## Alternatives

* https://github.com/franckverrot/rb_import

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

