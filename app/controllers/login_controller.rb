class LoginController < ApplicationController
  def index
    
  end
  def create
    render text: params[:login].inspect
  end
end
