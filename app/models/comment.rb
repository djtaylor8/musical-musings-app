class Comment < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :playlist, optional: true 
end
