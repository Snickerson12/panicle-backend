class PendingUserGroupSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :group_id, :group
end
