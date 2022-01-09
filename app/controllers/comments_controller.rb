class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path, notice: 'コメントを追加しました。'
    else
      flash.now[:error] = '保存に失敗しました。'
        render :new
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:comment)
  end
end
