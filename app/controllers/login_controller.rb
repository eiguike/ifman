class LoginController < ApplicationController

  before_filter :redis_connection, except: [:index, :create]
  before_filter :connection_available?, except: [:index, :create]

  def index
  end

  def create
    session[:user] = params[:user]
    session[:password] = params[:password]

    redirect_to controller: :dashboard, action: :index
  end

  def logout
    session[:user] = nil
    session[:password] = nil
    redirect_to controller: :login, action: :index
  end

end
