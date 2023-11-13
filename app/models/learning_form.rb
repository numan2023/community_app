class LearningForm
  include ActiveModel::Model

  attr_accessor(
    :title, :content, :image, :user_id,
    :id, :created_at, :updated_at,
    :tag_name
   )

  validates :title, :user_id, presence: true
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def save
    return false unless valid?
    learning = Learning.create(title: title, content: content, image: image, user_id: user_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      LearningTagRelation.create(learning_id: learning.id, tag_id: tag.id)
    end
  end

  def update(params, learning)
    #一度タグの紐付けを消す
    learning.learning_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    learning.update(params)
    LearningTagRelation.create(learning_id: learning.id, tag_id: tag.id) if tag_name.present?
  end
end