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
    expect(Persona.singleton_methods).to eq []

    # Metodo de clase
    class Persona
      def self.correr
        'Estoy corriendo'
      end
    end


    expect(Persona.singleton_methods).to eq [:correr]



    # instance_methods lo entienden sólamente Module y su subclase, Class. Nos dice no que métodos "tiene" ese objeto,
    # sino que métodos define para sus instancias.
    # el mensaje instance_methods puede tomar por parámetro un flag que dice si incluir en el resultado los métodos
    # heredados.
    expect(Object.instance_methods(false).count).to eq 0

    # methods lo entienden los objetos en general, y nos dice que métodos "tiene" un objeto.
    expect(Object.methods.count).to eq 133

    # respond_to?, que nos dice si un objeto entiende un mensaje
    expect(4.respond_to? :+).to eq true

    # El módulo Kernel entiende un mensaje const_get que, dado el nombre de una constante, nos devuelve su valor.
    expect(Kernel.const_get 'Persona').to eq Persona

    troy = Array.new

    troy.push 3

    puts troy.size
    puts troy.first
    puts troy[2]


  end


  describe 'String' do
    it 'should dar un String' do
      # el \n inicia una nueva línea, pero sólo funciona
      # dentro de comillas dobles
      "Los hermanos sean unidos\nPorque esa es la ley primera"

      autores = ["Borges", "Casares", "Saer"]
      # el string generado es el resultado de evaluar las expresiones interpoladas en #{}
      # y concatenar las partes
      "La duda es uno de los nombres de la inteligencia, #{autores.first}."
    end
  end

end
