require 'securerandom'

class Insert
  def initialize(repository)
    @repository = repository
  end

  def execute(data)
    if !data[:name]
      raise ArgumentError, "Missing person's name."
    end

    raffle_type = data[:number] >= 100 ? "impressa" : "virtual"

    @repository.create({
      id: SecureRandom.uuid,
      name: data[:name],
      phone: data[:phone],
      address: data[:address],
      social_media: data[:social_media],
      number: data[:number],
      type: raffle_type
    })

    return data
  end
end
