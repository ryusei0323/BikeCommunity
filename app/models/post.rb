class Post < ApplicationRecord
  belongs_to :user

  attachment :post_image

  validates :post_title, presence: true
  validates :post_sentence, presence: true, length: {maximum: 200}

end
