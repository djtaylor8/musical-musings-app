class User < ApplicationRecord
    has_many :playlists
    has_many :comments
    has_many :playlist_comments, :through => :playlists, :source => :comments 

    has_secure_password
end
