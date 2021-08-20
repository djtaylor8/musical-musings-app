class Comment < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :playlist, optional: true 

    validates :content, presence: true
    validates :content, length: { minimum: 1, maximum: 500, too_long: "%{count} characters is the maximum allowed" }

    def date 
        self.updated_at.strftime("%b %d, %Y")
    end
end
