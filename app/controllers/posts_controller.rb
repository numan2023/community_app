class PostsController < ApplicationController
  
  def index
    @learnings = Learning.joins(:learning_likes).group(:learning_id).order('count(learning_id) desc')
    @jobs = Job.joins(:job_likes).group(:job_id).order('count(job_id) desc')
  end

end
