class LearningsController < ApplicationController
  before_action :set_learning, only: [:edit, :update]

  def index
    @learning = Learning.new
    @learnings = Learning.includes(:user).order("created_at DESC")
  end

  def new
    @learning_form = LearningForm.new
  end

  def create
    @learning_form = LearningForm.new(learning_form_params)
    if @learning_form.valid?
      @learning_form.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @learningから情報をハッシュとして取り出し、@learning_formとしてインスタンス生成する
    learning_attributes = @learning.attributes
    @learning_form = LearningForm.new(learning_attributes)
    @learning_form.tag_name = @learning.tags.first&.tag_name
  end

  def update
    # paramsの内容を反映したインスタンスを生成する
    @learning_form = LearningForm.new(learning_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @learning_form.image ||= @learning.image.blob

    if @learning_form.valid?
      @learning_form.update(learning_form_params, @learning)
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @learnings = Learning.search(params[:keyword])
  end

  private
  def learning_form_params
    params.require(:learning_form).permit(:title, :content, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_learning
    @learning = Learning.find(params[:id])
  end

end