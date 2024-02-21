# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
  @admin = Admin.find_by(email: params[:admin][:email])

  if @admin
    if !@admin.valid_password?(params[:admin][:password])
      flash[:danger] = 'ログインに失敗しました。正しいメールアドレスとパスワードを入力してください。'
      redirect_to new_admin_session_path
    else
      sign_in(@admin)
      flash[:notice] = '管理者ログインしました'
      redirect_to admin_root_path
    end
  else
    flash[:danger] = 'ログインに失敗しました。正しいメールアドレスとパスワードを入力してください。'
    redirect_to new_admin_session_path
  end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_in_path_for(resource)
    admin_root_path
  end


  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    new_admin_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
