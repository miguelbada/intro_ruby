require 'rspec'
require_relative '../src/Persona'
require_relative '../src/Zombie'

describe 'intro test' do
  it 'should un_numero vale 7, porque el bloque incrementador no está aplicado. Por tanto, no se le suma 1.' do
    un_numero = 7
    incrementador = proc { un_numero += 1 }

    expect(un_numero).to eq 7
  end

  it 'should otro_numero vale 10, porque el bloque duplicador se aplica mediante el envío de mensaje call, que hace que
      se ejecute el código dentro del bloque. Por tanto, se duplica su valor.' do
    otro_numero = 5
    duplicador = proc { otro_numero *= 2 }.call

    expect(otro_numero).to eq 10
  end

  it 'should find devuelve únicamente un elemento.' do
    # Un dato curioso para tener en cuenta: ¡los mensajes find y detect hacen exactamente lo mismo! :open_mouth:
    # Recordemos que el equal? era un mensaje que nos decía si dos objetos son el mismo
    numeros = [1, 2, 3, 4, 5]

    anuncios = [{ ciudad: 'Tandil', empresa: 'Plasmar', plataforma: 12 },
                { ciudad: 'Buenos Aires', empresa: 'El lento', plataforma: 13 },
                { ciudad: 'Azcochinga', empresa: 'Artazar', plataforma: 18 },
                { ciudad: 'Tandil', empresa: 'Johnny Tur', plataforma: 12 }]

    mancuspias = [{edad: 3, peso: 12},
                  {edad: 4.5, peso: 16},
                  {edad: 2, peso: 13}]

    expect(numeros.select { |n| n > 3 }).to eq [4, 5]
    expect(numeros.find { |n| n > 3 }).to eq 4
    expect(numeros.any? { |n| n > 4 }).to eq true
    expect(numeros.all? { |n| n > 1 }).to eq false
    expect(numeros.map { |n| n * 10 }).to eq [10, 20, 30, 40, 50]
    expect(numeros.sum).to eq 15
    expect(numeros.inject(0) { |accum, it| accum + it }).to eq 15
    expect(numeros.sum(&:__id__)).to eq 35
    expect(numeros.count).to eq 5
    expect(numeros.count { |n| n > 3 }).to eq 2
    expect(anuncios.select { |a| a[:ciudad] == 'Tandil' }.collect { |p| p[:plataforma] }.last).to eq 12
    peso_promedio = mancuspias.map { |m| m[:peso] }.inject(0) { |accum, it| accum + it } / mancuspias.length

    maxima_edad = mancuspias.map { |m| m[:edad] }.sort.last
    edades_mas_pesadas = mancuspias.sort { |m1, m2|m2[:peso] <=> m1[:peso] }.take(3).map{ |m| m[:edad] }
    cantidad_menores_de_3 = mancuspias.select { |m| m[:edad] < 3 }.count

    numeros.push 6
    numeros.push 7

    expect(numeros.size).to eq 7

    numeros.delete 6
    numeros.delete 7

    expect(numeros.size).to eq 5

    expect(numeros.equal?([1, 2, 3, 4, 5])).to eq false

    otros_numeros = numeros

    expect(otros_numeros.equal?(numeros)).to eq true

    expect(Module.instance_methods.include? :new).to eq false
    Class.instance_methods.include? :new

  end
end
