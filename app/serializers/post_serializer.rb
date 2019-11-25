class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :comments, :user_id, :group_id
end
