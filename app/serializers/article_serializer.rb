class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author_name, :author, :comment

  def author
    {author_id:
    self.object.user.id,
    author_name: self.object.user.name
    }
  end

  def comment
    self.object.comments.map do |comment|
      {
       content: comment.content,
       commentator: comment.commentator,
       id: comment.id
      }
    end
  end
end
