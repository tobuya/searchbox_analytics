require 'rails_helper'

RSpec.describe SearchTerm, type: :model do
  it 'is valid with a term' do
    search_term = SearchTerm.new(term: 'Ruby on Rails')
    expect(search_term).to be_valid
  end

  it 'is not valid without a term' do
    search_term = SearchTerm.new(term: nil)
    expect(search_term).to_not be_valid
  end

  it 'has many user searches' do
    search_term = SearchTerm.reflect_on_association(:user_searches)
    expect(search_term.macro).to eq(:has_many)
  end

  it 'destroys associated user searches when deleted' do
    search_term = SearchTerm.create!(term: 'Ruby on Rails')
    search_term.user_searches.create!(ip_address: '127.0.0.1')
    expect { search_term.destroy }.to change { UserSearch.count }.by(-1)
  end
end
