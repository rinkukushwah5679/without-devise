class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def comment_index
    @comments = Comment.all
  end
  def comment_show
    @comment = Comment.find(params[:id])
  end
  def comment_edit
    @comment = Comment.find(params[:id])
  end
  def comment_new
    @comment = Comment.create(:title=>params[:title], :user_id=>params[:user_id])
  end
  def create_comment
    @user = User.find(params[:user_id])
    @comment = Comment.create(:title=>params[:title], :user_id=>@user.id)
    redirect_to user_path(@user)
  end

  def sign_in
    @user = User.new
  end

  def session_create
    require 'bcrypt'
    user = User.find_by_email(params[:user][:email])
    password =  params[:user][:password]
    if user.present?
        my_password = BCrypt::Password.new(user.password)
      if my_password == password     #=> true
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    else
      flash[:notice]= "message"
      redirect_to :back, :notice => "Email Not found, please enter correct email."
    end
  end

  def session_destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
