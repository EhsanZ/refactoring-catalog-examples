class Book
  attr_accessor :name, :author

  def initialize(name)
    @name = name
    @author = author
  end

  def discount
    Discount.new(factor: factor)
    send_notification_to_readers
  end

  protected

  def ratings
    Rating.search(author: @author, value: 5)
  end

  def factor
    ratings.count > 100 ? 0.50 : 0.20
  end

  def send_notification_to_readers
    Email.new(
      emails: ratings.pluck(:email),
      text: "#{@name} is at a discount!"
    )
  end
end
