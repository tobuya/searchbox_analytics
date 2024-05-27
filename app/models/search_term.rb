class SearchTerm < ApplicationRecord
    has_many :user_searches

    validates :term, presence: true
end
