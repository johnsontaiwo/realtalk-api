class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :gender, :date_of_birth, :article

  def article
    self.object.articles.map do |article|
    {article_id: article.id,
     article_title: article.title
    }
    end
  end
end
