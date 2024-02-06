class Public::PostMoviesController < ApplicationController
  def new
    @post_movie = PostMovie.new
  end

  # 投稿データの保存
  def create
    @post_movie = PostMovie.new(post_movie_params)
    @post_movie.customer_id = current_customer.id
    if @post_movie.save
      redirect_to post_movies_path
    else
      render :new
    end
  end

  def index
    @post_movies = PostMovie.all
    @post_movies = PostMovie.page(params[:page]).per(6)
  end

  def show
    @post_movie = PostMovie.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  # 投稿データのストロングパラメータ
  private

  def post_movie_params
    params.require(:post_movie).permit(:title, :image, :impression, :star)
  end

end
