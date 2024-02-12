class CreatePostMovieTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_movie_tags do |t|
      t.references :post_movie, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
