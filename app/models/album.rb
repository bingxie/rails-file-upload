class Album < ActiveRecord::Base
  has_many :photos
  def to_s
    name
  end
end
