require 'rails_helper'

RSpec.describe UserSearch, type: :model do
  let(:search_term) { SearchTerm.create(term: 'Ruby on Rails') }

  it 'is valid with an ip_address and search_term' do
    user_search = UserSearch.new(ip_address: '127.0.0.1', search_term:)
    expect(user_search).to be_valid
  end

  it 'is not valid without an ip_address' do
    user_search = UserSearch.new(ip_address: nil, search_term:)
    expect(user_search).to_not be_valid
  end

  it 'belongs to a search_term' do
    association = UserSearch.reflect_on_association(:search_term)
    expect(association.macro).to eq(:belongs_to)
  end

  describe '.log_search' do
    context 'when there is no previous search' do
      it 'creates a new search term and user search' do
        expect do
          UserSearch.log_search('127.0.0.1', 'Ruby on Rails')
        end.to change(UserSearch, :count).by(1)
          .and change(SearchTerm, :count).by(1)
      end
    end

    context 'when the term is similar to the last search term' do
      before do
        UserSearch.create!(ip_address: '127.0.0.1', search_term:)
      end

      it 'does not create a new user search' do
        expect do
          UserSearch.log_search('127.0.0.1', 'Ruby')
        end.to change(UserSearch, :count).by(1)
      end
    end

    context 'when the term is different from the last search term' do
      before do
        UserSearch.create!(ip_address: '127.0.0.1', search_term:)
      end

      it 'creates a new user search' do
        expect do
          UserSearch.log_search('127.0.0.1', 'JavaScript')
        end.to change(UserSearch, :count).by(1)
      end
    end
  end

  describe '#broadcast_search' do
    it 'broadcasts the search term and IP address' do
      user_search = UserSearch.new(ip_address: '127.0.0.1', search_term:)
      expect(ActionCable.server).to receive(:broadcast).with(
        'search_analytics_channel',
        { search_term: 'Ruby on Rails', ip_address: '127.0.0.1' }
      )
      user_search.save!
    end

    it 'rescues from broadcast errors' do
      allow(ActionCable.server).to receive(:broadcast).and_raise(StandardError.new('Broadcast failed'))
      user_search = UserSearch.new(ip_address: '127.0.0.1', search_term:)
      expect(Rails.logger).to receive(:error).with('Broadcast failed: Broadcast failed')
      user_search.save!
    end
  end
end
