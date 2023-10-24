class JobLikesController < ApplicationController
  before_action :set_job

  def create
    like = current_user.job_likes.build(job_id: params[:job_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = JobLike.find_by(job_id: params[:job_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
