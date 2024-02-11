class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @post_movies = PostMovie.looks(params[:search], params[:word])
    end
    render 'search_result'
  end

end
