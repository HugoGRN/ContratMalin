class Information < ApplicationRecord
    belongs_to :user
    has_many :contrats
end
