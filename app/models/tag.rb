class Tag < ApplicationRecord
  has_many :post_movie_tags, dependent: :destroy
  has_many :post_movies, through: :post_movie_tags
  
  def to_s_japanese
    I18n.t("enums.tag.name.#{name}")
  end
  
end
