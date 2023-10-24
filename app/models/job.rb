class Job < ApplicationRecord
  belongs_to :user
  has_many :job_likes
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Job.where('content LIKE(?)', "%#{search}%")
    else
      Job.all
    end
  end

  def job_liked_by?(user)
    job_likes.where(user_id: user.id).exists?
  end
end
