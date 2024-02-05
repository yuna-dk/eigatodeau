class CreatePostMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_movies do |t|
      t.string :image, null: false
      t.text :impression, null: false
      t.string :star, null: false
      t.string :title, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
