class AddingValidationAdminToPlacesNew < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :validated, :boolean, default: false
  	add_column :places, :reviewed, :boolean, default: false
  end
end
