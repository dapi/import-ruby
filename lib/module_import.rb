require "module_import/version"

# Попытка реализовать import а-ля es6
#
# importer на входе принимает название модуля. Создает абстрактный класс, инклюдит в него
# модуль и отдает инстанс. Типовое использование:
#
#
# Helpers = Importer.import TextHelper
#
# Helpers.truncate('text')
module ModuleImport
  def self.import(module_class)
    if module_class.is_a? Class
      klass = module_class
    else
      klass = Class.new
      klass.include module_class
    end
    klass.new
  end
end
