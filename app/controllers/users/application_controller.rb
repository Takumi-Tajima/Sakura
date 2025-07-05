class Users::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern

  private

  def current_cart
    @current_cart ||= current_user.cart || current_user.create_cart!
  end
end
