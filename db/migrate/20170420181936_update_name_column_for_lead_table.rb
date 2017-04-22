class UpdateNameColumnForLeadTable < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :first_name, :string
    add_column :leads, :last_name, :string
    remove_column :leads, :name, :string

    add_column :representatives, :first_name, :string
    add_column :representatives, :last_name, :string  
    
  end
end
