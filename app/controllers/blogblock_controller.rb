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
    redirect_to blogblock_index_path
  end
end