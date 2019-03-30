class Employee
  attr_accessor :name, :email, :location, :years_of_service

  def initialize(name, email, location, years_of_service)
    @name = name
    @email = email
    @location = location
    @years_of_service = years_of_service
  end

  def rename(new_name)
    if !validate_presence_of(new_name)
      send_message('Invalid user\'s name')
    end

    @name = new_name
  end

  def relocate(new_country, new_city)
    if !validate_presence_of(new_city) || !validate_presence_of(new_country)
      send_message('invalid country/city name')
    end

    set_location
    pay_for_relocating
  end

  private

  def validate_presence_of(attribute)
    return attribute.length > 0
  end

  def send_message(text)
    message = Message.new(@email, @name, text)
    message.send
  end

  def set_location(city, country)
    @location = { 'city': city, 'country': country }
  end

  def pay_for_relocating
    return if @years_of_service < 5 || !from_saudi_arabia?

    Payment.new(@years_of_service * 400, @email)
  end

  # No local variables
  def from_saudi_arabia?
    @location['country'] == 'Saudi Arabia'
  end
end
