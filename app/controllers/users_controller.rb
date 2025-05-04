class UsersController < ApplicationController
  def show
    @user = User.find(params.expect(:id))
  end

  def new
    @user = User.new
  end
end
