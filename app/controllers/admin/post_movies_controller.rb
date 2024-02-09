class Admin::PostMoviesController < ApplicationController
  def index
    @post_movies = PostMovie.all
    @post_movies = PostMovie.page(params[:page]).per(6)
  end

  def show
    @post_movie = PostMovie.find(params[:id])
  end
end
