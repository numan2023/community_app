class LearningLikesController < ApplicationController
  before_action :set_learning

  def create
    like = current_user.learning_likes.build(learning_id: params[:learning_id])
    like.save
    redirect_to "/learnings"
  end

  def destroy
    like = LearningLike.find_by(learning_id: params[:learning_id], user_id: current_user.id)
    like.destroy
    redirect_to "/learnings"
  end

  def set_learning
    @learning = Learning.find(params[:learning_id])
  end
end
