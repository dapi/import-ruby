require 'test_helper'

class ModuleImportTest < Minitest::Test
  module TestModule
    def helper
    end
  end

  class TestClass
    def helper
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::ModuleImport::VERSION
  end

  def test_import_module
    h = ModuleImport.import TestModule

    assert h.respond_to? :helper
  end

  def test_import_class
    h = ModuleImport.import TestClass

    assert h.respond_to? :helper
  end
end
