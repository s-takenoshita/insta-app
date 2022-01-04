class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render 'posts/index'
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '保存できました'
      # render :index
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, images: [])
    end

end
