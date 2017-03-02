
require_relative 'plane'
require_relative 'weather'


class Airport
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 12

    def initialize(capacity=DEFAULT_CAPACITY)
      @capacity = DEFAULT_CAPACITY
      @planes = []
      @weather = Weather.new
    end

    def land(plane)
      fail "Sorry you cannot land, airport is full" if full?
      fail "You cannot land due to bad weather" if weather.stormy?
      plane.landed
      planes << plane
    end

    def take_off(plane)
      fail 'You cannot take off due to bad weather' if weather.stormy?
      plane.taken_off
      planes.pop
    end

    def full?
      planes.count >= capacity
    end

private

attr_reader :planes

end
