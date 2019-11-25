class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :posts, :comments
end
