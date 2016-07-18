class CreateBookmark < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.string :money
      t.string :message
      t.string :site
      t.string :janlus
      t.string :categories
      t.timestamps nu11: false
    end
  end
end
