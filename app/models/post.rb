class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
  validates :text, presence: true, length: { minimum: 4, maximum: 250 }

  belongs_to :user, foreign_key: 'user_id'
end
