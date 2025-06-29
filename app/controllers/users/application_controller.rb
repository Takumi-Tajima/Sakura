class Users::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern
  layout 'application'
end
