class ImsController < ApplicationController
  before_action :require_user_logged_in, except: [:create, :new]
  def create
    @user = current_user
    @im = current_user.build_im(im_params)
    if @im.save
      flash[:success] = 'imを作成しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'imの作成に失敗しました。'
      render :new
    end
  end

  def update
    @user = current_user
    @im = Im.find(params[:id])
    
    if @im.save
      flash[:success] = 'imを編集しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'imの編集に失敗しました。'
      render :edit
    end
  end

  def new
    @im = Im.new
  end

  def index
    @pagy, @ims = pagy(Im.all, items: 25)
  end

  def edit
    @im = Im.find(params[:id])
  end

  def show
    @im = Im.find(params[:id])
    @user = User.find(params[:id])
  end
  
  private
  
  def im_params
    params.require(:im).permit(:real_name, :career, :pastime, :one_point)
  end
end
