class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :posts, :comments, :pending_user_groups
end
