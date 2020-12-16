class Bike < ApplicationRecord
  belongs_to :manufacturer



  attachment :bike_image

    with_options presence: true do
      validates :bike_image
      validates :bike_name, length: {minimum: 1}
      validates :displacement
      validates :manufacturer_id
      validates :bike_type_name
      validates :bike_sentence
    end
  enum bike_status: {'有効': true, '無効': false}

  scope :active, -> { where(bike_status: true) }
end
