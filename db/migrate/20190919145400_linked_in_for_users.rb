class LinkedInForUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact_url, :string
  end
end
