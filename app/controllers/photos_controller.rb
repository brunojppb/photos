class PhotosController < ApplicationController


    before_action :confirm_logged_in

    def index
        @photos = Photo.all
    end

    def new
        @photo = Photo.new
        @user = User.find_by_id(params[:user_id])
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.is_checked = false
        @user = User.find_by_id(params[:user_id])
        @photo.user = @user
        if @photo.save
            redirect_to(:controller => "users", :action => 'index')
        end
    end

    private
        def photo_params
            params.require(:photo).permit(:image)
        end

end
