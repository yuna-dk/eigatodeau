class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    @post_movies = PostMovie.page(params[:page]).per(6)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_my_page_path(@customer.id)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :email)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to post_movies_path
    end
  end

end
