class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author

  def author
    {author_id:
    self.object.user.id,
    author_name: self.object.user.name
    }
  end
end
