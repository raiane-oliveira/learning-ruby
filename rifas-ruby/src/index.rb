require_relative 'repositories/in-memory-raffle'

require_relative 'use-cases/insert'
require_relative 'use-cases/delete'
require_relative 'use-cases/find'
require_relative 'use-cases/show'
require_relative 'use-cases/create-csv'

require_relative 'utils/get-required-int'
require_relative 'utils/get-required-input'
require_relative 'utils/get-input'

choiceUser = ARGV[0]

if ARGV.length != 1 || !['insert', 'delete', 'find', 'show', 'create-csv'].include?(choiceUser)
  puts "Use uma dessas opções [insert], [delete], [find], [show], [create-csv]"
  exit 1
end

in_memory_raffle = InMemoryRaffle.new

options = {
  insert: Insert.new(in_memory_raffle),
  delete: Delete.new(in_memory_raffle),
  find: Find.new(in_memory_raffle),
  show: Show.new(in_memory_raffle),
  'create-csv': Create_CSV.new(in_memory_raffle),
}

useCase = options[choiceUser.to_sym]

case choiceUser
when "insert"
  begin

    raffles_amount = get_required_int("Quantas rifas você quer adicionar? ")

    raffles_amount.times do
      name = get_required_input("Nome: ").downcase
      phone = get_required_input("Telefone: ")
      address = get_input("Endereço: ").downcase
      social_media = get_input("Rede social: ")
      number_choosen = get_required_int("Número escolhido: ")

      useCase.execute({
        name: name,
        phone: phone,
        address: address,
        social_media: social_media,
        number: number_choosen,
      })

      puts "\nRifa inserida com sucesso!"
    end

    Create_CSV.new(in_memory_raffle).execute

  rescue Interrupt
    puts "\nAção interrompida!"
  end


when "delete"
  useCase.execute
when "find"
  useCase.execute
when "show"
  useCase.execute
when "create-csv"
  useCase.execute
end

puts "\nObrigada por utilizar o programa!"
