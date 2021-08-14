class User < ApplicationRecord
    has_many :playlists
    has_many :comments
    has_many :playlists, through: :comments 
end
