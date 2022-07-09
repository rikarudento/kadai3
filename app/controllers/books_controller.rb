class BooksController < ApplicationController
   def new
    @book = Book.new
   end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
    else
        flash[:alret] = "error"
        @books = Book.all
        @user = current_user
        render "index"
    end

   end

  def index
   @books = Book.all
   @book = Book.new
   @user = current_user

  end

  def show
   @user = current_user
   @book_new = Book.new
   @book = Book.find(params[:id])
   @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
   if @book.user==current_user
      render "edit"
   else
      redirect_to books_path
   end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
    else
        flash[:alret] = "error"
       
        render "edit"
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title, :profile_image)
  end
end