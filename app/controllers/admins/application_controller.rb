class Admins::ApplicationController < ActionController::Base
  before_action :authenticate_administrator!
  allow_browser versions: :modern
  layout 'admins'
end
