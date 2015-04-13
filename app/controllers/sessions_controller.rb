class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Success
      redirect_to user
    else
      flash.now[:danger] = 'Login details incorrect'
      render 'new'
    end
  end

  def destroy
  end
end
