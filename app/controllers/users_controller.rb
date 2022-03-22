class UsersController < ApplicationController


 def index #users_path
  @users=User.all
  @user=current_user
  @book=Book.new
 end


 def show #user_path
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
 end



  def edit # edit_user_path
   @user=User.find(params[:id])
   #if @user == current_user
   #render "edit"
   #else
   unless @user==current_user

   redirect_to user_path(current_user)
   #end
   end
  end


  def update
    @user=User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id),notice:'You have updated user successfully.'
   else
    render:edit
   end
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end


end