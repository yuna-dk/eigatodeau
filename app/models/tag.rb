class Tag < ApplicationRecord
  has_many :post_movie_tags, dependent: :destroy
  has_many :post_movies, through: :post_movie_tags
end
