class Tag < ApplicationRecord
  has_many :post_movie_tags, dependent: :destroy
  has_many :post_movies, through: :post_movie_tags

  # validates :tag, presence: true

  # enum name: { anime: 0, horror: 1, action: 2, comedy: 3, love: 4, fantasy: 5, kids: 6, others: 7 }

  def to_s_japanese
    I18n.t("enums.tag.name.#{name}")
  end

end
