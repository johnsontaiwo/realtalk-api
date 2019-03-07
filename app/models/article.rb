class Article < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :title, :content, :author_name, presence: true
end
