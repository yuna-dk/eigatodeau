class Public::PostCommentsController < ApplicationController

  def create
    @post_movie = PostMovie.find(params[:post_movie_id])
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_movie_id = @post_movie.id
    @post_comment.save
    # redirect_to post_movie_path(post_movie)
  end

  def destroy
    @post_movie = PostMovie.find(params[:post_movie_id])
    PostComment.find(params[:id]).destroy
    # redirect_to post_movie_path(params[:post_movie_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
