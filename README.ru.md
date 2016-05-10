# ModuleImport

[![Build Status](https://travis-ci.org/dapi/module_import.svg?branch=master)](https://travis-ci.org/dapi/module_import)

[English](README.ru.md) | *Русский*

Оператор `import` используется для импорта функций и объектов экспортируемых из другого модуля или классов в Ruby.

Это хорошая альтернатива `extend` и `include`, которая не подмешивает в ваш объект сторонние методы и не имеет побочных эффектов.

Идея взята из использования [ES6 import statement](https://developer.mozilla.org/en/docs/web/javascript/reference/statements/import)

## Обоснование

Чем плохи `extend` или `include`? 

Тем что они подмешивюат в ваш объект или модуль "не известно что", ваши методы могут быть перекрыты или ващ объект может перекрыть импортируемые методы и они перестанут работать ожидаемым образом. 
В случае с `ModuleImport` каждый подключаемый модуль или класс импортируется в виде экземпляра класса полностью изолизованного от вызываемого его окружения. Это безопасно и просто.

Например:

```Ruby
FH = ModuleImport.import FooHelpers  # Импортировали модуль как экземпляр класса,
                                     # для которого сами выбрати имя контстанты (FH)
FH.some_method                       # Безопасно вызываем метод 
```

## Установка

Чтобы использовать `ModuleImport.import` добавьте в `Gemfile` приложения:

```ruby
gem 'module_import'
```

Чтобы метод `import` стал доступен глобально через расширение класса `Object`.

```ruby
gem 'module_import', require: 'module_import/inject'
```

Далее выполняем:

    $ bundle

Ну или установите как есть:

    $ gem install module_import

## Использование

### Чистый Ruby

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

### Rails-окружение

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

Я рекомендую создать каталог `app/utils` и хранить в них примитевные хелперы используемые на всех слоях приложения.

## Альтернативы

* https://github.com/franckverrot/rb_import

## Разработка и доработка

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/module_import. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
