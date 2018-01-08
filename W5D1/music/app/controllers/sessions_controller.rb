class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params)
    if @user 
      log_in(@user)
      redirect_to bands_url
    else 
      flash[:errors] = "User doesn't exist bro"
      redirect_to sessions_new_url
    end
  end

  def destroy
    log_out
    redirect_to bands_url
  end

  private

  def session_params
    params.require('user').permit(:email, :password)
  end
end
