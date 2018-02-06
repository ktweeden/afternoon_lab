class Bus

  attr_reader :destination, :passengers
  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    return "Brum brum"
  end

  def how_many_passengers()
    return @passengers.count()
  end

  def add_new_passenger(person)
    @passengers << person
  end

  def drop_off_passenger(passenger_name)
    for passenger in @passengers
      @passengers.delete(passenger) if passenger.name() == passenger_name
    end
  end

  def remove_all_passengers()
    @passengers = []
  end

  def pick_up_from_stop(bus_stop)
    @passengers.concat(bus_stop.queue())
    bus_stop.empty_queue()
  end
end
