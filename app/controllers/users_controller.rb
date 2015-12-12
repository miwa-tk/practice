class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Practice English!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    if @user != current_user 
      redirect_to root_path
    end
  end
  
  def update
    if @user != current_user
      redirect_to root_path
    else
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
  end


  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  
    
    
  
  
end
