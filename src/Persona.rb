class Persona
  @felicidad = 100

  # Construye getters y setters.
  attr_accessor :felicidad

  def comer(calorias)
    @felicidad += calorias * 0.001
  end
end

# class Saludo
#   def saludar
#     "Buen día"
#   end
# end
#
# class SaludoFormal < Saludo
#   def saludar
#     super + " señoras y señores"
#   end
# end
#
# =begin manuel_dario = Object.new
#
# def manuel_dario.cantar_sobre(tema)
#   tema + ', shalalala'
# end
#
# manuel_dario = Object.new
#
# class << manuel_dario
#   def manuel_dario.cantar_sobre(tema)
#     tema + ', shalalala'
#   end
# end
