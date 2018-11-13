class Zombi
  # El mensaje initialize nos permite especificar cómo queremos que se inicialice la instancia de una clase.
  def initialize(salud_inicial)
    @salud = salud_inicial
  end

  attr_reader :salud

  def gritar
    '¡agrrrg!'
  end

  def sabe_correr?
    false
  end

  def sin_vida?
    @salud == 0
  end

  def recibir_danio!(puntos)
    @salud = [@salud - puntos * 2, 0].max
  end
end
