class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
   if @book.save
   redirect_to book_path(@book.id),notice:'You have updated user successfully.'
   else
     @books=Book.all
     @user=current_user
    render:index
   end
  end


  def index #books_path
    @book=Book.new
    @books=Book.all
    @user=current_user
  end
  
  def show #book_path
    @newbook=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end



 def edit
    @book=Book.find(params[:id])
  if @book.user == current_user
  render "edit"
  else
  redirect_to books_path
  end
 end
 

  def update
    @book=Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path, notice:'You have updated user successfully.'
   else
    render:edit
   end
  end


  def destroy#book_path
   @book=Book.find(params[:id])  # データ（レコード）を1件取得
   @book.destroy  # データ（レコード）を削除
   redirect_to books_path # 投稿一覧画面へリダイレクト  
  end
     
     
    private
      
      def book_params
       params.require(:book).permit(:title,:body)
      end
  
end
