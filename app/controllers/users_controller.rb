class UsersController < ApplicationController
  def show
    @user = User.find(params.expect(:id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: %i[name email password password_confirmation])
  end
end
