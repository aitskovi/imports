A = Imports.import 'basic_file.rb'

class B
  def test
    A.new.test
  end
end

Imports.export B
