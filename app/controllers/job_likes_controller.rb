class JobLikesController < ApplicationController

  def create
    like = current_user.job_likes.build(job_id: params[:job_id])
    like.save
    redirect_to "/jobs"
  end

  def destroy
    like = JobLike.find_by(job_id: params[:job_id], user_id: current_user.id)
    like.destroy
    redirect_to "/jobs"
  end

end
