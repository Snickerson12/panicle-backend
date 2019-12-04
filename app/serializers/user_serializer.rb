class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :bio, :posts, :comments, :user_groups, :groups, :photos, :pending_user_groups

end
