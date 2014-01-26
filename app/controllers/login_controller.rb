class LoginController < ApplicationController
  def index
    @login=Login.new
  end
  def new
    @login=Login.new
  end
  def create
    @login=Login.new(login_params)
    begin
     @login.save
     render text: "sign up success!"#redirect_to :posts
    rescue
     render text: "This account exist already!"
    end
  end
  def show
    if params[:login]
      @login=Login.find_by params[:login]
      if @login != nil && params[:login][:password] == @login.password
      redirect_to :posts
      else
      render text: "login fail!"
      end
    end
  end
  private
  def login_params
    params.require(:login).permit(:username, :password)
  end
end
