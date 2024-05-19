class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: {code: 200, data: @post}
  end

  def show
    @post = Post.find(params[:id])
    render json: {code: 200, data: @post}
  end

  def create
    # Post.create(
    #   title: params[:title],
    #   content: params[:content]
    # )

    # @post = Post.new
    # @post.title = params[:title] + "추가"
    # @post.content = params[:content]
    # @post.save

    Post.create(post_params)
  end

  def new  # 새창 -> 앱에서는 거의 필요없음

  end

  def edit

  end

  def update
    @post = Post.find(params[:id])
    #@post = Post.find_by(title:)
    #Post.where(title:)

    @post.update(
      title: params[:title],
      content: params[:content],
    )

    # @post.title = params[:title] + "cc"
    # @post.content = params[:content]
    # @post.save

    # @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
  end

  def custom_action

  end

  private
  def post_params
    params.permit(:title, :content)
  end
end
