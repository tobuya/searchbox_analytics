class UserSearch < ApplicationRecord
  belongs_to :search_term

  validates :ip_address, presence: true

  after_create_commit :broadcast_search

  def self.log_search(ip_address, term)
    Rails.logger.debug "Attempting to log search term: #{term} for IP: #{ip_address}"
    last_search = UserSearch.where(ip_address: ip_address).order(created_at: :desc).first
    if last_search.nil? || !term.start_with?(last_search.search_term.term)
      Rails.logger.debug "Creating new search term: #{term} for IP: #{ip_address}"
      search_term = SearchTerm.find_or_create_by(term: term)
      create(search_term: search_term, ip_address: ip_address)
    else
      Rails.logger.debug "Search term: #{term} is similar to the last searched term for IP: #{ip_address}"
    end
  end

  private

  def broadcast_search
    Rails.logger.debug "Broadcasting to search_analytics_channel with term: #{self.search_term.term} and IP: #{self.ip_address}"
    ActionCable.server.broadcast("search_analytics_channel", { search_term: self.search_term.term, ip_address: self.ip_address })
  rescue => e
    Rails.logger.error "Broadcast failed: #{e.message}"
  end
end
