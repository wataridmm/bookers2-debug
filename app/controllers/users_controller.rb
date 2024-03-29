class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]


  def show
    @user = User.find(params[:id])
    @books = @user.books

    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    # @relationship = current_user.relationships.find_by(follow_id: @user.id)
    # @set_relationship = current_user.relationships.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id

      redirect_to user_path(current_user)
    end
  end

end
