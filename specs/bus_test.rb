require("minitest/autorun")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class TestBus < MiniTest::Test
  def setup()
    @bus = Bus.new(22, "Ocean Terminal")
    @passenger = Person.new("Kate", 28)
    @bus_stop = BusStop.new("CodeClan")
    @bus_stop.add_person_to_queue(@passenger)
    @bus_stop.add_person_to_queue(Person.new("John", 44))
  end


  def test_get_destination()
    destination = @bus.destination
    assert_equal("Ocean Terminal", destination)
  end

  def test_drive()
    result = @bus.drive
    assert_equal("Brum brum", result)
  end

  def test_how_many_passengers()
    result = @bus.how_many_passengers
    assert_equal(0, result)
  end

  def test_add_new_passenger()
    @bus.add_new_passenger(@passenger)
    assert_equal(1, @bus.how_many_passengers())
  end

  def test_drop_off_passenger()
    @bus.add_new_passenger(@passenger)
    @bus.drop_off_passenger("Kate")
    assert_equal(0, @bus.how_many_passengers())
  end

  def test_remove_all_passengers()
    @bus.add_new_passenger(@passenger)
    @bus.add_new_passenger(Person.new("Arthur", 30))
    @bus.remove_all_passengers()
    result = @bus.how_many_passengers()
    assert_equal(0, result)
  end

  def test_pick_up_from_stop()
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(2, @bus.how_many_passengers())
    assert_equal(0, @bus_stop.queue().count())
  end
end
