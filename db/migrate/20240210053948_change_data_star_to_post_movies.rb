class ChangeDataStarToPostMovies < ActiveRecord::Migration[6.1]
  def change
    change_column :post_movies, :star, :float
  end
end
