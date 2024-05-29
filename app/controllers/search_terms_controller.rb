class SearchTermsController < ApplicationController
  before_action :initialize_trie, only: [:create]

  def index
    @search_terms = SearchTerm
                      .select('search_terms.term, COUNT(user_searches.id) AS searches_count')
                      .joins(:user_searches)
                      .group('search_terms.term')
                      .order('searches_count DESC')
                      .limit(10)
    respond_to do |format|
      format.html
      format.json { render json: @search_terms }
    end
  end

  def create
    term_segment = params[:term]
    ip_address = request.remote_ip
    Rails.logger.debug "Processing search term: #{term_segment} for IP: #{ip_address}"
    completed_search = process_term_segment(term_segment)

    if completed_search
      UserSearch.log_search(ip_address, completed_search)
      flash[:notice] = "Search term processed"
    else
      flash[:alert] = "Incomplete search term"
    end
    redirect_to search_terms_path
  end

  private

  def initialize_trie
    @trie = Rails.cache.fetch('search_terms_trie', expires_in: 12.hours) do
      trie = Trie.new
      SearchTerm.pluck(:term).each { |term| trie.insert(term) }
      trie
    end
  end

  def process_term_segment(term_segment)
    matches = @trie.autocomplete(term_segment)
    matches.first
  end
end
