class Post < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :like, -> { order(created_at: :desc) }, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user
	accepts_nested_attributes_for :photos
	def liked_by(user)
        like.find_by(user_id: user.id, post_id: id)
    end
    has_many :comments, dependent: :destroy
    
end
