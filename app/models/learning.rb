class Learning < ApplicationRecord
  belongs_to :user
  has_many :learning_likes
  has_one_attached :image

  def self.search(search)
    if search != ""
      Learning.where('title LIKE(?)', "%#{search}%")
    else
      Learning.all
    end
  end

  def learning_liked_by?(user)
    learning_likes.where(user_id: user.id).exists?
  end
end
