class PhotosController < ApplicationController


    def index
        @photos = Photo.all
    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.is_checked = false
        if @photo.save
            redirect_to(:action => 'index')
        end
    end

    private
        def photo_params
            params.require(:photo).permit(:image)
        end

end
