class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all
    render 'posts/index'
  end

  def show
    binding.pry

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

  def destroy
    binding.pry
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
    def post_params
      params.require(:post).permit(:content, images: [])
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
