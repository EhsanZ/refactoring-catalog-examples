class Company
  attr_accessor :name

  def initialize(name)
    return if name.length < 10

    @name = name
  end
end
