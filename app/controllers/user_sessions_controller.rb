class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
      @user.update(:sessions => (@user.sessions + 1))

      if @user.sessions == 1
        redirect_to(new_person_path, notice: "Login Succesfull")
      else
  		  redirect_back_or_to(home_path, notice: "Login Succesfull")
      end
  	else
  		flash.now[:alert] = "Login Failed"
  		render action: 'new'
  	end
  end

  def destroy
  	logout 
  	redirect_to( home_path, notice: "Logged out")
  end
end
