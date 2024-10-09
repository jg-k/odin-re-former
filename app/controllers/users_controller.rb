class UsersController < ApplicationController
  def new
    
  end

  def create 
    @user = User.new(user_params)

    p @user.valid?
    p @user.errors.messages
    
    if @user.save 
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def user_params 
    params.require(:user).permit(:email, :password)
  end
end
