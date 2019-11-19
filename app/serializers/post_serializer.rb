class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :comments
end
