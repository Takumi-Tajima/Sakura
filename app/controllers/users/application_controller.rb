class Users::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern

  helper_method :current_cart

  private

  def current_cart
    @current_cart ||= current_user.cart || current_user.create_cart!
  end
end
