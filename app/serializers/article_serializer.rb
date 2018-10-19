class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :comment

  def author
    {author_id:
    self.object.user.id,
    author_name: self.object.user.name
    }
  end

  def comment
    self.object.comments.map do |comment|
      {
       content: comment.content
       #commenter: comment.user.name
      }
    end
  end
end
