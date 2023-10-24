class JobsController < ApplicationController
  def index
    @job = Job.new
    @jobs = Job.includes(:user)
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to action: :index
    else
      @jobs = Job.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
    redirect_to action: :index
  end

  def search
    @jobs = Job.search(params[:keyword])
  end

  private
  def job_params
    params.require(:job).permit(:content, :image, :url).merge(user_id: current_user.id)
  end

end