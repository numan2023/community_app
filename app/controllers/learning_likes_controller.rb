class LearningLikesController < ApplicationController

  def create
    like = current_user.learning_likes.build(learning_id: params[:learning_id])
    like.save
    redirect_to action: "/learnings"
  end

  def destroy
    like = LearningLike.find_by(learning_id: params[:learning_id], user_id: current_user.id)
    like.destroy
    redirect_to action: "/learnings"
  end

end
