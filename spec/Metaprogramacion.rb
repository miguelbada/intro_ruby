require 'rspec'
require_relative '../src/Persona'

describe 'Intro metaprogramacion' do
  it 'should un string tener clase String' do
    # El mensaje class nos permite saber de qué clase es un objeto.
    expect('Hola mundo'.class).to eq String

    expect(7.class.name).to eq 'Integer'

    expect( [5, 3].instance_of? Array).to eq true
    expect([5, 3].is_a? Array).to eq true
    expect( [5, 3].instance_of? Object).to eq false
    expect([5, 3].is_a? Object).to eq true
  end
end

describe 'Open class' do
  it 'should no saber responder al mensaje ejercitar' do
    # methods: lo entienden todos los objetos, y nos devuelve los métodos que tenga tanto el objeto como su clase y superclases
    # instance_methods: lo entienden las clases (y en general, los módulos), y nos devuelve los métodos que entienden sus instancias.
    expect(Persona.instance_methods.include? :felicidad).to eq true
    expect(Persona.instance_methods.include? :ejercitar).to eq false

    class Persona
      def ejercitar
        @felicidad += 10
      end
    end

    expect(Persona.instance_methods.include? :ejercitar).to eq true

  end
end

describe 'autométodo' do
  it 'should crear un autometodo' do
    miguel = Persona.new

    def miguel.cantar_sobre(tema)
      tema + ', shalalala'
    end

    expect(miguel.cantar_sobre('canción de fuego')).to eq 'canción de fuego, shalalala'
    expect(miguel.singleton_methods).to eq [:cantar_sobre]
    expect(Persona.singleton_methods).to eq [:comer]

    # Metodo de clase
    class Persona
      def self.correr
        'Estoy corriendo'
      end
    end

    expect(Persona.singleton_methods).to eq [:comer, :correr]


  end

end
