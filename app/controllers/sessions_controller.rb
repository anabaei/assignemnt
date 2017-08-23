class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
     if user #&.authenticate(params[:session][:password])
       session[:user_id] = user.id
       redirect_to home_path, notice: 'Thank you for signing in! ❤️'
     else
       flash.now[:alert] = 'Wrong email or password!'
       render :new
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Signed out!'
  end

end
