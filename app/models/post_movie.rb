class PostMovie < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :post_movie_tags, dependent: :destroy
  has_many :tags, through: :post_movie_tags

  validates :title, presence: true
  validates :image, presence: true
  validates :impression, presence: true,length:{maximum:200}
  validates :tags, presence: true

  # 絞り込み機能
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post_movie = PostMovie.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post_movie = PostMovie.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post_movie = PostMovie.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post_movie = PostMovie.where("title LIKE?","%#{word}%")
    else
      @post_movie = PostMovie.all
    end
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end