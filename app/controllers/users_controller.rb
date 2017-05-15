class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def index
  	@users = User.paginate( page: params[:page], per_page: 5)
  end	

  def new
  	@user = User.new
  end
  

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success]="Hey, #{@user.username.upcase}, Welcome to Alpha-Blog!"
  		redirect_to articles_path
  	else
  		
  		render 'new'	
  	end	
  	
  	
  end
  
  def edit
  	@user = User.find(params[:id])	
  end
  
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  	flash[:success] = "Sucessfully Updated Your Account"
  	  	redirect_to articles_path
  	else
  			
  		render 'edit'
  	end
 
  end
  
  def show
  	@user = User.find(params[:id])	
  end	
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end
  
  private
  def user_params
  	params.require(:user).permit(:username, :password, :email)
  end	
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your profile"
      redirect_to root_path
    end
   end 
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin can perform that action."
        redirect_to root_path
       end 
    end
end
  

