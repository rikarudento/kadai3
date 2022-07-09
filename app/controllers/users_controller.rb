class UsersController < ApplicationController


  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
   if current_user.id==@user.id
     render "edit"
   else
      redirect_to user_path(current_user.id)
   end
  

  end

  def index
   @users = User.all
   @book = Book.new
   @user = current_user
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully"
       redirect_to user_path(@user)
    else
        flash[:alret] = "error"

        render "edit"
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
