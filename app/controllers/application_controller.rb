class ApplicationController < ActionController::Base
  # 権限の設定
  before_action :authenticate_user!, except: [:top]
  # deviseのストロングパラメータの編集は"Application Controller"でのみ"編集及び修正"が可能
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
