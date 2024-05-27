class UserSearch < ApplicationRecord
  belongs_to :search_term

  validates :ip_address, presence: true

  def self.create_from_ip(ip, term)
    search_term = SearchTerm.find_or_create_by(term: term)
    create(search_term: search_term, ip_address: ip)
  end
end
