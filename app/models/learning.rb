class Learning < ApplicationRecord
  belongs_to :user
  has_many :learning_likes
  has_one_attached :image

  validates :title, :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Learning.where('content LIKE(?)', "%#{search}%")
    else
      Learning.all
    end
  end

  def learning_liked_by?(user)
    learning_likes.where(user_id: user.id).exists?
  end
end
