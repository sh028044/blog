class PostsController < ApplicationController
	def new
	 @post= Post.new
   @@blogblock_id=params[:blogblock_id]
	end
	def create
     @post=current_user.posts.build(params[:post].permit(:title, :text,:uploadfile))
     @post.blogblock_id=@@blogblock_id
  	 if @post.save
    	  redirect_to @post
  	 else
    	  render 'new'
  	 end
     
	end
	def show
  	 @post = Post.find(params[:id])
     
	end
	def index
     @posts=Post.where(blogblock_id: params[:blogblock_id]).page(params[:page]).per(5)
     #Post.page(params[:page]).per(5)
     #render text:@posts[0]#.=params[:blogblock_id]
     @users = User.find(:all)
     @blogblock_id=params[:blogblock_id]
	end
	def edit
  	 @post = Post.find(params[:id])
	end
	def update
  	 @post = Post.find(params[:id]) 
  	 if @post.update(params[:post].permit(:title, :text,:uploadfile))
    	  redirect_to @post
  	 else
    	  render 'edit'
  	 end
	end
	def destroy
  	 @post = Post.find(params[:id])
  	 @post.destroy
  	 redirect_to posts_path
	end
private
  	def post_params
    	 params.require(:post).permit(:title, :text,:user_id,:uploadfile)
  	end
end
