require 'rails_helper'

RSpec.describe Trie, type: :service do
  let(:trie) { Trie.new }

  describe '#insert' do
    it 'inserts a word into the trie' do
      trie.insert('hello')
      node = trie.search_prefix('hello')
      expect(node).not_to be_nil
      expect(node.is_end_of_word).to be true
    end
  end

  describe '#search_prefix' do
    before { trie.insert('hello') }

    it 'returns the node corresponding to the given prefix' do
      node = trie.search_prefix('hell')
      expect(node).not_to be_nil
      expect(node.is_end_of_word).to be false
    end

    it 'returns nil if the prefix is not found' do
      expect(trie.search_prefix('world')).to be_nil
    end
  end

  describe '#search' do
    before { trie.insert('hello') }

    it 'returns true if the word is in the trie' do
      expect(trie.search('hello')).to be true
    end

    it 'returns false if the word is not in the trie' do
      expect(trie.search('world')).to be false
    end

    it 'returns false if the word is only a prefix in the trie' do
      expect(trie.search('hell')).to be false
    end
  end

  describe '#autocomplete' do
    before do
      trie.insert('hello')
      trie.insert('hell')
      trie.insert('heaven')
      trie.insert('heavy')
    end

    it 'returns all words with the given prefix' do
      expect(trie.autocomplete('he')).to contain_exactly('hello', 'hell', 'heaven', 'heavy')
    end

    it 'returns an empty array if the prefix is not found' do
      expect(trie.autocomplete('world')).to be_empty
    end

    it 'returns words that are exactly the prefix' do
      expect(trie.autocomplete('hell')).to contain_exactly('hello', 'hell')
    end
  end
end
