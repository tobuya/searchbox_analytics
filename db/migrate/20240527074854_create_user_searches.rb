class CreateUserSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_searches do |t|
      t.string :ip_address
      t.references :search_term, null: false, foreign_key: true

      t.timestamps
    end
  end
end
