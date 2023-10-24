class LearningsController < ApplicationController
  def index
    @learning = Learning.new
    @learnings = Learning.includes(:user)
  end

  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      redirect_to action: :index
    else
      @learnings = Learning.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @learning = Learning.find(params[:id])
  end

  def update
    learning = Learning.find(params[:id])
    learning.update(learning_params)
    redirect_to action: :index
  end

  def search
    @learnings = Learning.search(params[:keyword])
  end

  private
  def learning_params
    params.require(:learning).permit(:content, :image, :url).merge(user_id: current_user.id)
  end

end
