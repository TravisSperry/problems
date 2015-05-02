class UsersController < ApplicationController
  before_filter :authorize_admin!, except: :show
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #redirect if not user's page or user not admin
  end

  def new
    @user = User.new
    @generated_password = Devise.friendly_token.first(8)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, flash: { success: 'User was successfully created.' } }
        format.js
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])

    redirect_to root_url, error: 'You can only edit your page.' unless user_admin_auth ||current_user == @user
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      unless params[:user][:password] && params[:user][:password] != params[:user][:password_confirmation]
        if @user.update_attributes(user_params)
          format.html { redirect_to @user, flash: { success: 'User was successfully updated.' } }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to edit_user_path(@user), flash: { error: 'Your password does not match the password confirmation.' } }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def user_admin_auth
      current_user && (current_user == @user || current_user.admin?)
    end
end
