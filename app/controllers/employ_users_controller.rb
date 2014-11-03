class EmployUsersController < ApplicationController
	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(get_user_params)
  	@user.save
    flash[:success] = "恭喜你，申请成功！请耐心等待电话或者邮件通知您参加面试。"
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
