class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:danger] = "All fields need to be filled correctly"
      redirect_to '/signup'
  end

end

private

def user_params
params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
end
end