require 'test_helper'

require 'module_import/inject'

class ModuleImportInjectTest < Minitest::Test
  module TestModule
    def helper(arg)
      arg
    end
  end

  def test_import
    assert self.respond_to? :import, 'No method import in object'

    h = self.import TestModule
    assert h.helper(1)
  end
end
