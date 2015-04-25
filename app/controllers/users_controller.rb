class UsersController < ApplicationController
  before_filter :authenticate_user!

  expose(:users)
  expose(:user)

end
