class AddViewCountToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :view_count, :integer, :default => 0
  end
end
