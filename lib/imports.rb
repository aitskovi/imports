require "imports/version"

#TODO: Deal with circular dependancies
module Imports
  MODULES = {}

  def self.import(path)
    base_path = caller_locations.first.absolute_path
    absolute_path = File.expand_path(path, "#{base_path}/..")

    unless MODULES.include?(absolute_path)
      # Load the imported module, it'll register itself with the exports.
      Kernel.load(absolute_path, true)
    end

    MODULES[absolute_path]
  end

  def self.export(objects)
    absolute_path = caller_locations.first.absolute_path

    if MODULES[absolute_path]
      raise RuntimeError.new('Doubly imported file')
    end

    MODULES[absolute_path] = objects
  end
end
