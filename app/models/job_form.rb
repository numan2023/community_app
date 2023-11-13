class JobForm
  include ActiveModel::Model

  attr_accessor(
    :title, :content, :image, :user_id,
    :id, :created_at, :updated_at
   )

  validates :title, :user_id, presence: true
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def save
    return false unless valid?
    Job.create(title: title, content: content, image: image, user_id: user_id)
  end

  def update(params, job)
    job.update(params)
  end
end