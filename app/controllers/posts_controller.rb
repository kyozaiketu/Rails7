class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  # 投稿一覧画面
  def index
      @posts = Post.all
  end
  # 新しい投稿画面
  def new
      @post = Post.new
  end
  # 追加処理画面
  def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end
  # 編集画面
  def edit
    # @post = Post.find(params[:id])
  end
  # 更新処理画面
  def update  
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end 
  end
  # 削除処理
  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  #リファクタリング
  def set_post
    @post = Post.find(params[:id])
  end


end
