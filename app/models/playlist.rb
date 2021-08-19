class Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs
    has_many :comments
    has_many :users, through: :comments 

    accepts_nested_attributes_for :songs, allow_destroy: true
    accepts_nested_attributes_for :comments, allow_destroy: true
    
    validates :title, :story, presence: true
    validates_uniqueness_of :title, :story 
    validates :story, length: { minimum: 1, maximum: 5000, too_long: "%{count} characters is the maximum allowed" }

    def self.recent
      where('created_at > ?', Time.now-30.days.ago).order('created_at DESC')
    end

    def date 
      self.updated_at.strftime("Updated on %m/%d/%Y at %I:%M%p")
    end
end
