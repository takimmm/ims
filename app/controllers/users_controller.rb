class UsersController < ApplicationController

  def show
    @im = current_user.im
    if current_user.im.present?
      @user = current_user
    else
      redirect_to new_im_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def mylists
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:im_id)
    @mylist_ims = Im.find(favorites)
    @pagy, @ims = pagy(current_user.favorites, items: 25)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end