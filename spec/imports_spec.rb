require 'spec_helper'

describe Imports do
  it 'has a version number' do
    expect(Imports::VERSION).not_to be nil
  end

  it 'can import a basic file' do
    A = import('basic_file.rb')

    expect(A.new.test).to eq('test')
  end

  it 'can import a file with imports' do
    B = import('basic_file.rb')
    C = import('file_with_imports.rb')

    expect(C.new.test).to eq(B.new.test)
  end
end
