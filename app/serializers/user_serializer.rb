class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :location, :bio, :posts, :comments, :user_groups, :groups, :photos

end
