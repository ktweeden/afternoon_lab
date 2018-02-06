require("minitest/autorun")
require_relative("../bus_stop")
require_relative("../person")
class TestBusStop < MiniTest::Test
  def setup()
    @bus_stop = BusStop.new("CodeClan")
    @passenger = Person.new("Dave", 99)
end

def test_add_person_to_queue
  @bus_stop.add_person_to_queue(@passenger)
  assert_equal(1, @bus_stop.queue.count)
end

def test_empty_queue()
  @bus_stop.empty_queue()
  assert_equal(0, @bus_stop.queue.count)
end
end
