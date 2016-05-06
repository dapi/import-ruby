# Inject import method into Object
class Object
  def import(*args)
    ModuleImport.import(*args)
  end
end
