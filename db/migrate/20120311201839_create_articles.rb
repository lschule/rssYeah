class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published
      t.text :author
      t.string :guid
      t.timestamps
    end
  end
end