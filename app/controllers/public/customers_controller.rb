class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]
  
  def mypage
    @customer = current_customer
    @post_movies = @customer.post_movies.page(params[:page]).per(3)
    render :show
  end
  
  def show
    @customer = Customer.find(params[:id])
    @post_movies = @customer.post_movies.page(params[:page]).per(3)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "編集を保存しました"
      redirect_to customers_my_page_path(@customer.id)
    else
      flash.now[:alert] = "編集の保存に失敗しました"
      render :edit
    end
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
    customer = current_customer
    unless customer.id == current_customer.id
      redirect_to post_movies_path
    end
  end

end
