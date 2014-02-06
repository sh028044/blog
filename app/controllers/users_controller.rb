class UsersController < ApplicationController
#class Users::SessionsController < Devise::SessionsController
  def show
    user_session
    redirect_to root_path
  end
end
