class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :commentator
end
