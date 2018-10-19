class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :articles
end
