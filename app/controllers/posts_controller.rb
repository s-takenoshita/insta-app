class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all.order(id: "DESC")
    # render 'posts/index'
  end

  def show
    # binding.pry
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
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
