class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Overwriting the sign_in/sign_out redirect path method
  def after_sign_in_path_for(admin)
    podcasts_path
  end

  def after_sign_out_path_for(admin)
    root_path
  end

  
end