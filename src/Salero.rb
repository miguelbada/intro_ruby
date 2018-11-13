class Salero

  # los constructores en ruby se declaran mediante initialize,
  # que es un método comun y corriente
  def initialize(gramos_de_sal)
    @gramos_de_sal = gramos_de_sal
  end

  # los métodos se declaran mediante def,
  # y por convención, aquellos que terminan en ! tienen efecto
  def vaciar!
    @gramos_de_sal = 0
  end

  def espolvorear!
    # los atributos siempre arrancan con una @,
    # y son privados. Y ¡ah!: no se declaran,
    # sino que se usan directamente
    @gramos_de_sal -= 10
  end

  def vacio?
    # la última línea de un método es su retorno.
    # Dicho de otra forma, no es necesario utilizar `return`s
    @gramos_de_sal == 0
  end

  def derramar!
    @gramos_de_sal -= 50
  end

  def lleno?
    @gramos_de_sal >= 250 && @gramos_de_sal <= 300
  end
end
