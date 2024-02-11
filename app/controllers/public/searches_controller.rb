class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @post_movies = PostMovie.looks(params[:search], params[:word]).page(params[:page]).per(6)
    end
    render 'search_result'
  end

end
