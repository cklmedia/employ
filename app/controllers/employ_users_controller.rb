class EmployUsersController < ApplicationController
	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(get_user_params)
  	@user.save
	  redirect_to :back
  end

  def index
    @users = User.order(created_at: :desc)
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :card, :sex,:tel,:email,:like_group,:talking)
    end
end
