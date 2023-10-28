class PostsController < ApplicationController
  
  def index
    @learnings = Learning
                .joins(:learning_likes)
                .select("learnings.*, count(learning_likes.id) AS like_count")
                .group("learnings.id")
                .order('like_count desc')

    @jobs = Job
            .joins(:job_likes)
            .select("jobs.*, count(job_likes.id) AS like_count")
            .group("jobs.id")
            .order('like_count desc')
  end

end
