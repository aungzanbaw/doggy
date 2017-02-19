class UsersController < ApplicationController
  # before_action :authenticate

  def index
    render json: User.all, status: 200
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :phone)
    end

  # protected
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  # end
end
