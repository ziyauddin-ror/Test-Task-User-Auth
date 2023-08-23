class Api::V1::PostsController < Api::V1::ApiController
	before_action :authorize_user
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
 	def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

  # GET /posts/1
  def show
    render json: @post, serializer: PostSerializer
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
	  params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
	end

	def authorize_user
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end
end
