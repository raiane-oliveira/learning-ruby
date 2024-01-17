class InMemoryRaffle
  attr_accessor :items

  def initialize
    @items = []
  end

  def get
    return @items
  end

  def create(data)
    @items.push(data)
  end

  def delete(id)
    @items = @items.select { |item| item.id != id }
  end

  def find(id)
    return @items.find { |item| item.id == id }
  end
end
