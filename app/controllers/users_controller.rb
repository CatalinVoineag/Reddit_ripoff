class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: "User Created" }
        format.json { render :show, status: :created, location: @user }
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@user)
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def index
  end

  def update
  end

  def destroy
  end

  def show
    @user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
