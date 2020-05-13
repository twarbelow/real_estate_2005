class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def price_per_square_foot
    total_square_feet = 0
    rooms.each do |room|
      total_square_feet += room.area.to_f
    end
    (price.tr("$", "").to_f / total_square_feet).round(2)

  end
end
