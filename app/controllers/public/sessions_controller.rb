# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

    before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    posts_path
  end


  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
    protected

     def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     end


  def reject_member
    @member = Member.find_by(email: params[:member][:email])
    if @member
      if @member.valid_passwors?(params[:member][:password]) && (@member.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_member_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

end
