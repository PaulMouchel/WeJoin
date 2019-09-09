class AddingAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :description, :text
    add_column :users, :age, :integer
    add_column :users, :is_admin, :boolean, default: false
  end
end
