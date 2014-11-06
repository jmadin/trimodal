class SessionsController < ApplicationController
  def new
  end

  def create
    contributor = Contributor.find_by(email: params[:session][:email].downcase)
    if contributor && contributor.authenticate(params[:session][:password])
      sign_in contributor
      redirect_back_or home_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
