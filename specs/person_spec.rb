require("minitest/autorun")
require_relative("../person")

class TestPerson < MiniTest::Test
  def setup()
    @person = Person.new("Kate", 28)
  end
  
end
