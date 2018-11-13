class Sobreviviente
  def initialize(una_energia)
    @energia = una_energia
  end

  attr_reader :energia

  def beber!
    @energia *= 1.25
  end

  def atacar!(un_zombie, danio)
    un_zombie.recibir_danio!(danio)
  end

  def ataque_masivo!(muchos_zombies)
    muchos_zombies.each { |zombie| atacar!(zombie, 15) }
  end
end