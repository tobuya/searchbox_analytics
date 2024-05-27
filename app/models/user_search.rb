class UserSearch < ApplicationRecord
  belongs_to :search_term

  validates :ip_address, presence: true
end
