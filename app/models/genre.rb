class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    name.downcase.split(/\W+/).join('-')
  end

    def self.find_by_slug(name)
      final = name.split('-').collect do |word|
                word.capitalize
              end
      final = final.join(" ")
      Genre.all.find_by(name:final)
    end

end
