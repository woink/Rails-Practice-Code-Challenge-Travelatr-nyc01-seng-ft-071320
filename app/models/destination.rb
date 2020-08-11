class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts
  
  def featured_post
    self.posts.max_by do |post|
      post.likes
    end
  end

  def avg_bloggers
    if self.bloggers.length > 0
    age = self.bloggers.map { |blogger| blogger.age }.sum
    length =  self.bloggers.length
    age / length
    else 
      0
    end
  end

end
