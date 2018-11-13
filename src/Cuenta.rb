class Cuenta
  attr_accessor :activa
  attr_reader :nombre, :saldo, :preferencias

  # los métodos pueden tomar parámetros
  def fusionar!(otra_cuenta)
    @saldo += otra_cuenta.saldo
    @preferencias.merge! otra_cuenta.preferencias
    otra_cuenta.activa = false
  end

  def debitar!(monto)
    # para enviar un mensaje a si mismo, simplemente
    # lo hacemos sin poner un objeto receptor
    validar_fondos! monto
    @saldo -= monto
  end

  def validar_fondos!(monto)
    # raise sirve para lanzar excepciones
    # Y los ifs también pueden ser utilizados de forma postfija
    raise "saldo insuficiente" if monto >= @saldo
  end
end