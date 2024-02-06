class Public::HomesController < ApplicationController
  def top
    @post_movies = PostMovie.order(created_at: :desc).limit(4)
  end
end
