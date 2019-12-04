class PhotosController < ApplicationController

    def index
        photos = Photo.all
        new_photos = photos.map do |photo|
            photo_file_url = rails_blob_path(photo.photo_file, disposition: "attachment", only_path: true)
            {group_id: photo.group_id, user_id: photo.user_id, caption: photo.caption, photo_file: photo_file_url}
        end
        render json: new_photos
    end

    def show
        photo = Photo.find(params[:id])    
        render json: photos
    end

    def create
        photo = Photo.create(photo_params)
        if photo.valid?
            photo_file_url = rails_blob_path(photo.photo_file, disposition: "attachment", only_path: true)
            render json: {group_id: photo.group_id, user_id: photo.user_id, caption: photo.caption, photo_file: photo_file_url}, status: :created
        else
            render json: { error: 'failed to create group' }, status: :not_acceptable
        end
    end

    private

    def photo_params
        params.require(:photo).permit(:user_id, :group_id, :caption, :photo_file)
    end

end
