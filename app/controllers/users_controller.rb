class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin, only: [:verify, :ban, :decline]
  before_action :check_verification, except: [:new, :create]

  def check_verification
    if current_user.status == "pending_verification"
      redirect_to verification_path
    elsif current_user.status == "banned"
      redirect_to banned_path
    elsif current_user.status == "rejected"
      redirect_to rejected_path
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def verify
    user = User.find(params[:id])
    user.verify
    redirect_to users_path
  end

  def ban
    user = User.find(params[:id])
    user.ban
    redirect_to users_path
  end

  def decline
    user = User.find(params[:id])
    user.decline
    redirect_to users_path
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to perform this action"
    end
  end

  def verification
    # render the page that informs the user they need to wait for verification
  end

  def banned
    # render the page that informs the user they are banned
  end

  def rejected
    # render the page that informs the user they are rejected
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.image.attach(params[:user][:profile_pic])

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.image.attach(params[:user][:profile_pic])
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nickname, :email, :name, :surname, :avatar, :location, :about_me, :contact_info, :company, :position, :slug, :role, :activity_status, :is_rejected, :reject_date, :reject_reason, :is_banned, :ban_date, :ban_reason, :telegram_id, :respect, :profile_pic)
    end
end
