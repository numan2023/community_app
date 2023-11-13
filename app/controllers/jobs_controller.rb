class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update]

  def index
    @job = Job.new
    @jobs = Job.includes(:user).order("created_at DESC")
  end

  def new
    @job_form = JobForm.new
  end

  def create
    @job_form = JobForm.new(job_form_params)
    if @job_form.valid?
      @job_form.save
      redirect_to action: :index
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # @jobから情報をハッシュとして取り出し、@job_formとしてインスタンス生成する
    job_attributes = @job.attributes
    @job_form = JobForm.new(job_attributes)
    @job_form.tag_name = @job.tags.first&.tag_name
  end

  def update
    # paramsの内容を反映したインスタンスを生成する
    @job_form = JobForm.new(job_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @job_form.image ||= @job.image.blob

    if @job_form.valid?
      @job_form.update(job_form_params, @job)
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @jobs = Job.search(params[:keyword])
  end

  private
  def job_form_params
    params.require(:job_form).permit(:title, :content, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

end