class Manufacturer < ApplicationRecord


  validates :manufacturer_name, presence: true, length: {maximum: 15}

  enum status: {'有効': true, '無効': false}
end
