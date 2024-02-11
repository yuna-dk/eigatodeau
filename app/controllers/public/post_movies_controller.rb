class Public::PostMoviesController < ApplicationController
  def new
    # ゲストログインの時は投稿できないようにする
    # if current_customer.nil?
    # redirect_to new_customer_session_path, alert: "投稿するにはログインが必要です"
    # else
      
    @post_movie = PostMovie.new
    # end
  end

  # 投稿データの保存
  def create
    # ゲストログインの時は投稿できないようにする
    # if current_customer.nil?
    # redirect_to new_customer_session_path, alert: "投稿するにはログインが必要です"
    # else
    
    @post_movie = PostMovie.new(post_movie_params)
    @post_movie.customer_id = current_customer.id
      if @post_movie.save
        flash[:notice] = "映画の投稿に成功しました"
        redirect_to post_movie_path(@post_movie.id)
      else
        flash.now[:alert] = "映画の投稿に失敗しました"
        render :new
      end
    # end
  end

  def index
    # 絞り込み機能
    if params[:latest]
     @post_movies = PostMovie.latest
    elsif params[:old]
     @post_movies = PostMovie.old
    elsif params[:star_count]
     @post_movies = PostMovie.star_count
    else
     @post_movies = PostMovie.all
    end

    @post_movies = @post_movies.page(params[:page]).per(6)
  end

  def show
    @post_movie = PostMovie.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_movie = PostMovie.find(params[:id])
  end

  def update
    post_movie = PostMovie.find(params[:id])
    if post_movie.update(post_movie_params)
      flash[:notice] = "編集を保存しました"
      redirect_to post_movie_path(post_movie.id)
    else
      flash.now[:alert] = "編集の保存に失敗しました"
      render :edit
    end
  end

  def destroy
    post_movie = PostMovie.find(params[:id])
    if post_movie.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to '/post_movies'
    else
      flash.now[:alert] = "投稿の削除に失敗しました"
      render :show
    end
  end

  # 投稿データのストロングパラメータ
  private

  def post_movie_params
    params.require(:post_movie).permit(:title, :image, :impression, :star)
  end

end
