class UserGroupSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :group_id, :group, :user
end
