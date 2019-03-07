class AddCommentatorToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :commentator, :string
  end
end
