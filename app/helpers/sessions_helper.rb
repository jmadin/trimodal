module SessionsHelper
  def sign_in(contributor)
    remember_token = Contributor.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    contributor.update_attribute(:remember_token, Contributor.encrypt(remember_token))
    self.current_contributor = contributor
  end

  def signed_in?
    !current_contributor.nil?
  end

  def current_contributor=(contributor)
    @current_contributor = contributor
  end

  def current_contributor
    remember_token = Contributor.encrypt(cookies[:remember_token])
    @current_contributor ||= Contributor.find_by(remember_token: remember_token)
  end

  def current_contributor?(contributor)
    contributor == current_contributor
  end
  
  def sign_out
    self.current_contributor = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default, :notice => 'Successfully signed in')
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
  
end
