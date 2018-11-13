require 'rspec'

describe 'Intro metaprogramacion' do
  it 'should un string tener clase String' do
    # El mensaje class nos permite saber de qué clase es un objeto.
    expect('Hola mundo'.class).to eq String

    #
  end
end
