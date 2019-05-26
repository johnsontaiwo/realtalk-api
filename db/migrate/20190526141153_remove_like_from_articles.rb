class RemoveLikeFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :like, :integer
  end
end
