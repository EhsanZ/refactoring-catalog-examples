class Book
  attr_accessor :name, :author

  def initialize(name)
    @name = name
    @author = author
  end

  def discount
    ratings = Rating.search(author: @author, value: 5)

    if ratings.count > 100
      Discount.new(factor: 0.90, item: self)
    else
      Discount.new(factor: 0.50, item: self)
    end

    Email.new(
      emails: ratings.pluck(:email),
      text: "#{@name} is at a discount!"
    )
  end
end
