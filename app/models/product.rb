class Product < ApplicationRecord
  def discounted?
    price < 50
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def as_json
    {
      id: id,
      name: name,
      image_url: image_url,
      description: description,
      price: price,
      is_discounted: discounted?,
      tax: tax,
      total: total
    }
  end
end