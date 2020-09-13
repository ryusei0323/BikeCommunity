class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image, destroy: false

  with_options presence: true do
    validates :name
    validates :account_name
    validates :profile_sentence
  end

  enum user_status: { '有効': true, '退会済': false }

end
