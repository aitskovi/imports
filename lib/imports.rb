require "imports/version"

# Stop ourselves from clobbering the import code.
unless defined? ::IMPORTS_MODULES

#TODO: Deal with circular dependancies

::IMPORTS_MODULES = {}

def import(path)
  base_path = caller_locations.first.absolute_path
  absolute_path = File.expand_path(path, "#{base_path}/..")

  unless ::IMPORTS_MODULES.include?(absolute_path)
    # Load the imported module, it'll register itself with the exports.
    Kernel.load(absolute_path, true)
  end

  ::IMPORTS_MODULES[absolute_path]
end

def export(objects)
  absolute_path = caller_locations.first.absolute_path

  if ::IMPORTS_MODULES[absolute_path]
    raise RuntimeError.new('Doubly imported file')
  end

  ::IMPORTS_MODULES[absolute_path] = objects
end

end
