class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :group_id, :photo_file

end
