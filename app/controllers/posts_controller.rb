class PostsController < ApplicationController
  before_action :require_login
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post created successfully!'
    else
      render :new_post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def require_login
  	redirect_to new_session_path unless session[:user_id]
  end
end
