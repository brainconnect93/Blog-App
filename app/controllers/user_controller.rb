class UsersController < ApplicationRecord
  def index
    @user = User.all
  end

  def show
    @user = User.create(param[:id])
  end
end
