class AddLikesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :likes, :integer
  end
end
