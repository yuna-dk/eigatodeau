class PostMovieTag < ApplicationRecord
  belongs_to :post_movie
  belongs_to :tag
end
