class HomeController < ApplicationController
  def index
    @error_message = session[:errors]
    session.delete :errors
  end
end
