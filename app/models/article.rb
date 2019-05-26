class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  after_initialize :init 
  validates :title, :content, :author_name, presence: true

  def init 
    self.likes ||= 0 if self.likes.nil?
  end
end
