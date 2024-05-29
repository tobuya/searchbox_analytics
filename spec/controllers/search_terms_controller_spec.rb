require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do
  describe 'GET #index' do
    before do
      search_term1 = SearchTerm.create!(term: 'Ruby')
      search_term2 = SearchTerm.create!(term: 'Rails')
      UserSearch.create!(ip_address: '127.0.0.1', search_term: search_term1)
      UserSearch.create!(ip_address: '127.0.0.2', search_term: search_term1)
      UserSearch.create!(ip_address: '127.0.0.3', search_term: search_term2)
    end

    it 'returns http success for HTML format' do
      get :index, format: :html
      expect(response).to have_http_status(:success)
      expect(assigns(:search_terms).first.term).to eq('Ruby')
      expect(assigns(:search_terms).first.searches_count).to eq(2)
    end

    it 'returns http success for JSON format' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.first['term']).to eq('Ruby')
      expect(json_response.first['searches_count']).to eq(2)
    end
  end

  describe 'POST #create' do
    let!(:search_term) { SearchTerm.create!(term: 'Ruby on Rails') }
    let!(:trie) do
      trie = Trie.new
      trie.insert(search_term.term)
      trie
    end

    before do
      allow(Rails.cache).to receive(:fetch).and_return(trie)
    end

    context 'with a complete term segment' do
      it 'logs the search and sets a notice flash message' do
        expect(UserSearch).to receive(:log_search).with('0.0.0.0', 'Ruby on Rails')
        post :create, params: { term: 'Ruby' }
        expect(flash[:notice]).to eq('Search term processed')
        expect(response).to redirect_to(search_terms_path)
      end
    end

    context 'with an incomplete term segment' do
      it 'does not log the search and sets an alert flash message' do
        expect(UserSearch).not_to receive(:log_search)
        post :create, params: { term: 'Invalid' }
        expect(flash[:alert]).to eq('Incomplete search term')
        expect(response).to redirect_to(search_terms_path)
      end
    end
  end
end
