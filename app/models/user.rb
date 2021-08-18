class User < ApplicationRecord
    has_many :playlists
    has_many :comments
    has_many :playlist_comments, :through => :playlists, :source => :comments 

    
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
      end
      
      def self.create_from_omniauth(auth) 
        create! do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.name = auth["info"]["first_name"]
          user.email = auth["info"]["email"]
        end
      end
      

end
