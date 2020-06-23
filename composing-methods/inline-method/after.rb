class Company
  attr_accessor :name

  def initialize(name)
    return if name.is_a?(String) && name.length < 10

    @name = name
  end
end
