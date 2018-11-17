require 'rspec'

describe 'Array tests' do
  it 'should algo' do
    a = [1, 2, 3, 4, 5]

    n = ['Miguel', 'Nancy', 'Juan', 'Manuel', 'Javier', 'Cintia', 'Miriam']

    m = ['Miguel', 'Nancy']

    # Resta de arrays
    expect(n - m).to eq ['Juan', 'Manuel', 'Javier', 'Cintia', 'Miriam']

    # Toma los primeros n elementos
    expect(a.take(2)).to eq [1, 2]

    # Elimina los primeros n elementos
    expect((1..7).drop(3)).to eq [4, 5, 6, 7]

    expect(["hamlet", "perez"].join(' ')).to eq "hamlet perez"

    expect([true, false, false].first).to eq true

    expect((1..5).collect { |n| n * 2 }).to eq [2, 4, 6, 8, 10]

    expect((1..30).reject { |n| n % 2 == 0 }).to eq [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]

  end
end
