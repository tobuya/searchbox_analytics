class SearchTerm < ApplicationRecord
  has_many :user_searches, dependent: :destroy

  validates :term, presence: true
end
