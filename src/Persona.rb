module Persona

  @felicidad = 100

  def self.felicidad
    @felicidad
  end

  def self.felicidad=(otra_felicidad)
    @felicidad = otra_felicidad
  end

  def self.comer(calorias)
    @felicidad += calorias * 0.001
  end
end

class Saludo
  def saludar
    "Buen día"
  end
end

class SaludoFormal < Saludo
  def saludar
    super + " señoras y señores"
  end
end

=begin manuel_dario = Object.new

def manuel_dario.cantar_sobre(tema)
  tema + ', shalalala'
end

manuel_dario = Object.new

class << manuel_dario
  def manuel_dario.cantar_sobre(tema)
    tema + ', shalalala'
  end
end
=end
