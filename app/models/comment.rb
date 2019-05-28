class Comment < ApplicationRecord
  #belongs_to :user
  after_initialize :init
  belongs_to :article

  def init 
    self.like ||= 0 if self.like.nil?
  end
end
