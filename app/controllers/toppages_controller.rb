class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to login_url
    end
  end
end
