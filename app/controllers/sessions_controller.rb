class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	#respond_to do |format|
  		if user && user.authenticate(params[:session][:password])
  			log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  			redirect_back_or user
	  	else
	  		flash.now[:error] = 'error'
        render :new
	  	#	format.html { render :new }
	  #		format.json { render json: user.errors, status: :unprocessable_entity }
	  	end
  	#end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

end
