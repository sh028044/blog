class BlogblockController < ApplicationController
  def index
    @blogblocks=Blogblock.find(:all)
  end

  def new
    @blogblocks= Blogblock.new
  end

  def create
    @blogblocks=Blogblock.new(params[:blogblock].permit(:name))
    @blogblocks.creator=current_user.id
    @blogblocks.save
    @blogblocks.users << current_user
    redirect_to root_path
  end
  def destroy
    @blogblock=Blogblock.find(params[:id])
    @blogblock.destroy
    redirect_to root_path
  end
end