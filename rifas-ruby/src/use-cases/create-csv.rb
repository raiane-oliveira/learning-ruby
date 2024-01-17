class Create_CSV
  def initialize(repository)
    @repository = repository
  end

  def execute
    if !File.exist?('rifas.csv')
      file = File.new('rifas.csv', 'w')
      file.write('id,nome,telefone,endereço,rede-social, número, tipo\n')
    else
      file = File.open('rifas.csv', 'w')
    end

    @repository.items.each do |item|
      file.write(item.values.join(',') + "\n")
    end
    puts "Creating csv file..."
  end
end
