class JobForm
  include ActiveModel::Model

  attr_accessor(
    :title, :content, :image, :user_id,
    :id, :created_at, :updated_at,
    :tag_name
   )

  validates :title, :user_id, presence: true
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.present?
  end

  def save
    return false unless valid?
    job = Job.new(title: title, content: content, user_id: user_id)

    # ここで画像をアタッチ
    job.image.attach(image) if image.present?

    if job.save
      if tag_name.present?
        tag = Tag.where(tag_name: tag_name).first_or_initialize
        tag.save
        JobTagRelation.create(job_id: job.id, tag_id: tag.id)
      end
      true
    else
      false
    end
  end

  def update(params, job)
    #一度タグの紐付けを消す
    job.job_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    job.update(params)
    JobTagRelation.create(job_id: job.id, tag_id: tag.id) if tag_name.present?
  end
end