A = crazy_import 'basic_file.rb'

class B
  def test
    A.new.test
  end
end

crazy_export B
