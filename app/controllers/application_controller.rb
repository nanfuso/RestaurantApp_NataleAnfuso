class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user


  def admin_signed_in?
    current_user && current_user.admin
  end
  helper_method :admin_signed_in?

  private

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    redirect_to '/' unless (current_user && current_user.admin)
  end

  def potential_subtotal
      potential_subtotal = 0
      @carted_products.where(status: "carted").each do |cp|
          potential_subtotal += cp.subtotal
      end
      potential_subtotal
  end
  helper_method :potential_subtotal


end
