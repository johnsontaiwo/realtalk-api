class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :article_id
end
