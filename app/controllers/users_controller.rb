class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success]="Hey, #{@user.username.upcase}, Welcome to Alpha-Blog!"
  	else
  		flash[:danger]="Unable to Signup invalid inforamtion"
  		render 'new'	
  	end	
  	
  	redirect_to articles_path
  end
  
  private
  def user_params
  	params.require(:user).permit(:username, :password, :email)
  end	
  
end
