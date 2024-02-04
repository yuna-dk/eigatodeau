class CreatePostMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :post_movies do |t|
      t.string :image
      t.text :impression
      t.string :star

      t.timestamps
    end
  end
end
