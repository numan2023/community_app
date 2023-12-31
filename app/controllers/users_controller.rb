class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :term, :hobby, :learn_reason, :career_pass, :impressed_app)
  end

end
