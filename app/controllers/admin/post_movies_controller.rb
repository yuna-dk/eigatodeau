class Admin::PostMoviesController < ApplicationController
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
  end
  
  def destroy
    post_movie = PostMovie.find(params[:id])
    if post_movie.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to '/admin/post_movies'
    else
      flash.now[:alert] = "投稿の削除に失敗しました"
      render :show
    end
  end
  
end
