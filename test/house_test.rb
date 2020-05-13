require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end


  def test_it_has_price
    @house = House.new("$400000", "123 sugar lane")
    assert_equal "$400000", @house.price
  end

  def test_it_has_address
    @house = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms
    assert_equal [], @house.rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_it_has_price_per_square_foot
    @house.add_room(@room_4)
    @house.add_room(@room_1)
    @house.add_room(@room_3)
    @house.add_room(@room_2)
    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    skip
    assert_equal [@room1, @room2, @room3, @room4], @house.sort_rooms_by_area
  end

  def test_it_can_sort_rooms_by_category
    skip
    assert_equal ({:bedroom=>[@room_1, @room2], :livingroom => [@room_3], :basement => [@room_4]}), @house.rooms_by_category
  end
end


# pry(main)> house.rooms_by_category
# #=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>], :living_room=> [#<Room:0x00007fccd383c2d0...>], :basement=> [#<Room:0x00007fccd297dc30...>]}
