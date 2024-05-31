require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do
  describe 'GET #index' do
    before do
      @search_term1 = create(:search_term, term: 'Term 1')
      @search_term2 = create(:search_term, term: 'Term 2')
      @search_term3 = create(:search_term, term: 'Term 3')

      @user_search1 = create(:user_search, search_term: @search_term1)
      @user_search2 = create(:user_search, search_term: @search_term2)
      @user_search3 = create(:user_search, search_term: @search_term2)
    end

    it 'assigns all search terms to @all_search_terms' do
      get :index
      expect(assigns(:all_search_terms)).to match_array([@search_term1, @search_term2, @search_term3])
    end

    it 'assigns trending search terms to @trending_search_terms' do
      get :index
      expect(assigns(:trending_search_terms).map(&:term)).to eq([@search_term2.term, @search_term1.term])
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns JSON with all and trending search terms' do
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['all_search_terms'].size).to eq(3)
      expect(json_response['trending_search_terms'].size).to eq(2)
    end
  end

  describe 'POST #create' do
    let(:trie) { instance_double('Trie') }

    before do
      allow(Rails.logger).to receive(:debug)
      allow(UserSearch).to receive(:log_search)
      allow(trie).to receive(:autocomplete).with('complete_term').and_return(['complete_term'])
      allow(trie).to receive(:autocomplete).with('incomplete_term').and_return([])

      # Mock the initialize_trie method to set @trie directly
      allow_any_instance_of(SearchTermsController).to receive(:initialize_trie) do |controller|
        controller.instance_variable_set(:@trie, trie)
      end
    end

    context 'when the search term is complete' do
      it 'logs the search and redirects to search terms path with a notice' do
        request.remote_ip = '127.0.0.1' # Directly set the remote IP
        post :create, params: { term: 'complete_term' }
        expect(UserSearch).to have_received(:log_search).with('127.0.0.1', 'complete_term').once
        expect(flash[:notice]).to eq('Search term processed')
        expect(response).to redirect_to(search_terms_path)
      end
    end

    context 'when the search term is incomplete' do
      it 'does not log the search and redirects to search terms path with an alert' do
        request.remote_ip = '127.0.0.1' # Directly set the remote IP
        post :create, params: { term: 'incomplete_term' }
        expect(UserSearch).not_to have_received(:log_search)
        expect(flash[:alert]).to eq('Incomplete search term')
        expect(response).to redirect_to(search_terms_path)
      end
    end
  end
end
