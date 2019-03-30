class Company
  attr_accessor :name

  def initialize(name)
    return if name_length < 10

    @name = name
  end

  def name_length(name)
    name.length
  end
end
