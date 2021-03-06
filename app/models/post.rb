class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :post_image

  validates :post_title, presence: true
  validates :post_sentence, presence: true, length: {maximum: 200}

#すでにいいねをしていればtrueを返す
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
