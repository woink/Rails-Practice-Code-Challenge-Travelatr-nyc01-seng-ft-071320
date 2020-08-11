class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    likes = 0
    self.posts.each do |post|
      likes += post.likes
    end
  likes
  end

  def featured_post
    self.posts.max_by do |post|
      post.likes
    end
  end

  def top_5
    self.posts.max_by do |post|
      post.count(destination)
    end
  end

end
