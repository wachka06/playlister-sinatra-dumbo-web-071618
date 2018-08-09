class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist
  def slug
    name.downcase.split(/\W+/).join('-')
  end

  def self.find_by_slug(name)
    final = name.split('-').collect do |word|
              word.capitalize
            end
    final = final.join(" ")
    Song.all.find_by(name:final)
  end

end
