class UsersController < ApplicationController
  def new
	@user  = User.new
	@title = "Sign up"
  end
  
  def show
	@user = User.find(params[:id])
  end
  
  def create
	#raise params[:user].inspect
	@user = User.new(user_params)
	
      if @user.save
        
		redirect_to @user, :flash => {:success => "Welcome to the Sample App!"}
		#format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @user }
      else
        @title = "Sign up"
		render 'new'
		#format.html { render action: 'new' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
   
  end
  
  def user_params
	params.require(:user).permit(:name, :email)
  end
end
