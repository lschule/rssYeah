class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :article_id
      t.string :message

      t.timestamps
    end
  end
end
