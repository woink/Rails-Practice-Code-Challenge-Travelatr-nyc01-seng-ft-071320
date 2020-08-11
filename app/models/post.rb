class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  
  def find_blogger_by_post
    Blogger.find_by(id: self.blogger_id )
  end

  def find_destination_by_post
    Destination.find_by(id: self.destination_id )
  end

end
