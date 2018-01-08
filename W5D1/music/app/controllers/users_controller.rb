class UsersController < ApplicationController

  def new
  end

  def create
    # create a user using params from provided from the view
    @user = User.new(user_params) 
    # attempt to save the user to the database
    if @user.save 
      # if all is good , log them in and redirect to a nice place 
      log_in(@user)
      redirect_to bands_url
    else 
      # otherwise render errors on the registration page and redirect them there as well
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
