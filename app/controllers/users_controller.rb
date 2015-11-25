class UsersController < ApplicationController
  	before_filter :authorize, except:[:new, :create]

	def show
		@user = User.find(params[:id])
	end

    def new
    	@user = User.new
    end

    def create
	    user = User.new(user_params)
	    if user.save
	      #update_authentication_token(user, nil)
	      session[:user_id] = user.id
	      cookies.permanent[:auth_token] = nil
	      redirect_to '/', notice:"Bienvenue '#{user.name}' !"
	    else
	      redirect_to '/signup'
	    end
	end

private
  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
  	end

end