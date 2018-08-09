class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.split(/\W+/).join('-')
  end

  def self.find_by_slug(name)
    final = name.split('-').collect do |word|
              word.capitalize
            end
    final = final.join(" ")
    Artist.all.find_by(name:final)
  end
end
